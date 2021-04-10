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
        boxHeight = view.set(.size, 60).first
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
        topBox.center(to: view)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: [.autoreverse, .repeat, .curveEaseIn], animations: {
            self.topBox.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.topBox.transform = CGAffineTransform(translationX: 100.0, y: 0)
            self.view.layoutIfNeeded()
        })
    }
}
