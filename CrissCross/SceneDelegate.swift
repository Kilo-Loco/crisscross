//
//  SceneDelegate.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let feedVC = FeedViewController()
        let window = UIWindow(windowScene: scene)
        window.rootViewController = feedVC
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

