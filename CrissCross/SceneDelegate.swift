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

    private var feedVC: FeedViewController {
        let vc = FeedViewController()
        let tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        tabBarItem.tag = 0
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    private var discoverVC: DiscoverViewController {
        let vc = DiscoverViewController()
        let tabBarItem = UITabBarItem(
            title: "Discover",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        tabBarItem.tag = 1
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    private var newPostVC: UIViewController {
        // blank since new post is presented modally
        let vc = UIViewController()
        let tabBarItem = UITabBarItem(
            title: nil,
            image: UIImage(systemName: "plus.rectangle.fill"),
            selectedImage: UIImage(systemName: "plus.rectangle.fill")
        )
        tabBarItem.tag = 2
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    private var inboxVC: InboxViewController {
        let vc = InboxViewController()
        let tabBarItem = UITabBarItem(
            title: "Inbox",
            image: UIImage(systemName: "text.bubble"),
            selectedImage: UIImage(systemName: "text.bubble.fill")
        )
        tabBarItem.tag = 3
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    private var profileVC: InboxViewController {
        let vc = InboxViewController()
        let tabBarItem = UITabBarItem(
            title: "Me",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        tabBarItem.tag = 4
        vc.tabBarItem = tabBarItem
        return vc
    }
    
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = TabBarController()
        tabBarController.viewControllers = [feedVC, discoverVC, newPostVC, inboxVC, profileVC]
        let window = UIWindow(windowScene: scene)
        window.rootViewController = tabBarController
        
        self.window = window
        window.makeKeyAndVisible()
    }
}

