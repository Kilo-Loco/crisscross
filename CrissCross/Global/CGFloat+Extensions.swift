//
//  CGFloat+Extensions.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    static var random: CGFloat {
        .random(in: 0 ... 1)
    }
}
