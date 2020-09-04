//
//  Clip.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Foundation

struct Clip {
    let id: String
    let username: String
    let caption: String
    let creationDate: Date
    
}

extension Clip: Hashable {
    
}
