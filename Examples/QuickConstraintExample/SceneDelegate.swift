//
//  SceneDelegate.swift
//  QuickConstraintDemo
//
//  Created by Paulius Gudonis on 11/06/2020.
//  Copyright © 2020 neqsoft. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    lazy var viewController = ViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        window?.makeKeyAndVisible()
    }
}
