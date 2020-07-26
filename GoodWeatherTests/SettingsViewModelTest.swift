//
//  SettingsViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Eros Campos on 7/26/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTest: XCTestCase {
    
    private var settingsVM: SettingsViewModel!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        self.settingsVM = SettingsViewModel()
    }
    
    override func tearDownWithError() throws {
        try? super.tearDownWithError()
        
        self.settingsVM = nil
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "Unit")
    }
    
    //Check that the default value of the viewmodel is celsius
    func testDefaultUnitIsCelsius() {
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    func testShouldReturnCorrectDisplayForNameforCelsius() {
        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Celsius")
    }
    
    func testIsAbleToSaveUserUnitSelection() {
        self.settingsVM.selectedUnit = .fahrenheit
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "Unit"))
    }
    
}
