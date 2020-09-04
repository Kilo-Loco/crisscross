//
//  UIColor+Extensions.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        UIColor(
            red: .random,
            green: .random, 
            blue: .random,
            alpha: 1
        )
    }
}

