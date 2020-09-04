//
//  UIView+Extensions.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

extension UIView {
    static func create(_ builder: (Self) -> Void) -> Self {
        let view = Self.init()
        builder(view)
        return view
    }
}
