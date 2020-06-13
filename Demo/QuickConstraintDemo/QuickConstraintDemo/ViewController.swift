//
//  ViewController.swift
//  QuickConstraintDemo
//
//  Created by Paulius Gudonis on 11/06/2020.
//  Copyright © 2020 neqsoft. All rights reserved.
//

import UIKit
import QuickConstraint

class ViewController: UIViewController {
    
    var boxHeight: LayoutConstraint?
    var boxConstraints: [Anchor: LayoutConstraint]!
    
    lazy var topBox: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        boxHeight = view.set(.height, 60).first
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        self.view.addSubview(topBox)
        boxConstraints = topBox.pin(toSafeArea: view)
        let _ = boxConstraints[.bottom]?.deactivated
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 3.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
             let _ = self.boxHeight?.deactivated
                       let _ = self.boxConstraints[.bottom]?.activated
                       self.view.layoutIfNeeded()
        })
    }
}
