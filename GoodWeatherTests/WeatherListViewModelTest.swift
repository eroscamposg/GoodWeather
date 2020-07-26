//
//  WeatherListViewModelTest.swift
//  GoodWeatherTests
//
//  Created by Eros Campos on 7/26/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTest: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try? super.setUpWithError()
        
        weatherListVM = WeatherListViewModel()
        weatherListVM.addWeatherViewModel(WeatherViewModel(weather: Weather(name: "Houston", currentTemperature: Temperature(temperature: 35, tempMin: 30, tempMax: 37))))
        weatherListVM.addWeatherViewModel(WeatherViewModel(weather: Weather(name: "Peru", currentTemperature: Temperature(temperature: 22, tempMin: 20, tempMax: 25))))
        weatherListVM.addWeatherViewModel(WeatherViewModel(weather: Weather(name: "Canada", currentTemperature: Temperature(temperature: 10, tempMin: 4, tempMax: 12))))
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try? super.tearDownWithError()
    }
    
    func testIsAbleToConvertToFahrenheit() {
        let fahrenheitTemperature = [95, 71.6, 50]
        
        self.weatherListVM.updateUnit(to: .fahrenheit)
        for (index, vm) in self.weatherListVM.weatherListViewModel.enumerated() {
            XCTAssertEqual(vm.currentTemperature, fahrenheitTemperature[index])
        }
    }
    
}
