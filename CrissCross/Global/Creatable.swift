//
//  Creatable.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import UIKit

protocol Creatable: UIView {
    init()
}

extension Creatable {
    static func create(_ builder: (Self) -> Void) -> Self {
        let view = Self.init()
        builder(view)
        return view
    }
    
    func configure(_ modifier: (Self) -> Void) -> Self {
        modifier(self)
        return self
    }
}

extension UIView: Creatable {}
