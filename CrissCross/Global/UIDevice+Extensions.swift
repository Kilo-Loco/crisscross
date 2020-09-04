//
//  UIDevice+Extensions.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
