//
//  Double+Extension.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/23/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

extension Double {
    var formatAsDegree: String {
        return String(format: "%.0fº", self)
    }
}
