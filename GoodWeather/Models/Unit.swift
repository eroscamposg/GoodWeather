//
//  Unit.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/24/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable{
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}
