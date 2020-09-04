//
//  DateService.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Foundation

struct DateService {
    private init() {}
    static let shared = DateService()
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        return formatter
    }()
}
