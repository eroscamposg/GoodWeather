//
//  SettingsViewModel.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/24/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

struct SettingsViewModel {
    let units = Unit.allCases
    
    private var _selectedUnit: Unit = Unit.celsius
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "Unit") as? String {
                return Unit(rawValue: value)!
            }
            
            return _selectedUnit
            
        } set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "Unit")
        }
    }
}
