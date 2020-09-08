//
//  Clip+Extensions.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Foundation

extension Clip: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension Clip: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id + username + caption + String(describing: creationDate))
    }
}
