//
//  Car.swift
//  car EW
//
//  Created by Hopes, William (AMM) on 17/01/2023.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        return """
        Make: \(make)
        Model: \(model)
        Top speed: \(topSpeed)mph
        Acceleration (0-60): \(acceleration)s
        Handling: \(handling)
"""
        
    }
}

