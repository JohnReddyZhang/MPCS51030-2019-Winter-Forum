//
//  Color.swift
//  HelloSettings
//
//  Created by Susan Stevens on 3/1/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

struct Color {
    
    static let teal = UIColor(red: 0, green: 145/255, blue: 147/255, alpha: 1.0)
    static let orange = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1.0)
    static let purple = UIColor(red: 122/255, green: 129/255, blue: 255/255, alpha: 1.0)
    
    static func from(_ identifier: String?) -> UIColor? {
        switch (identifier) {
        case "teal":
            return teal
        case "orange":
            return orange
        case "purple":
            return purple
        default:
            return nil
        }
    }
}
