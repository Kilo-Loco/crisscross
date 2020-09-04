//
//  TabBarController.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
        tabBar.isOpaque = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let firstItem = tabBar.items!.first!
        tabBar(tabBar, didSelect: firstItem)
        
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        tabBar.tintColor = item.tag == 0 ? .white : .black
        tabBar.barStyle = item.tag == 0 ? .black : .default
        
        if item.tag == 2 {
            let newPostVC = NewPostViewController()
            newPostVC.modalPresentationStyle = .overFullScreen
            present(newPostVC, animated: true)
        }
    }
}
