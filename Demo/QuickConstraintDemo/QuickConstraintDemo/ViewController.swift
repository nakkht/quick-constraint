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
    
    lazy var topBox: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    lazy var centerBox: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.set(.all, 60)
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
        topBox.pin(to: view, margin: 40)
        
        topBox.addSubview(centerBox)
        centerBox.center(to: topBox, axis: .all)
    }
}
