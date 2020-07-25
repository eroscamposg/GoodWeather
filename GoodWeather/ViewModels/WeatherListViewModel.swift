//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/20/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherListViewModel = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherListViewModel.append(vm)
    }
    
    func numberOfRowsInSection() -> Int {
        return self.weatherListViewModel.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherListViewModel[index]
    }
    
    mutating func updateUnit(to unit: Unit){
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    private mutating func toCelsius() {
       weatherListViewModel = weatherListViewModel.map({vm in
            let weatherModel = vm
            weatherModel.weather.currentTemperature.temperature.value = (weatherModel.weather.currentTemperature.temperature.value - 32) * 5/9
            return weatherModel
        })
    }
    
    private mutating func toFahrenheit() {
        weatherListViewModel = weatherListViewModel.map({vm in
             let weatherModel = vm
            weatherModel.weather.currentTemperature.temperature.value = (weatherModel.weather.currentTemperature.temperature.value * 9/5) + 32
            return weatherModel
         })
    }
    
}

struct WeatherViewModel {
    var weather: Weather
}

extension WeatherViewModel {
    var name: String {
        return self.weather.name.value.capitalized
    }
    
    var currentTemperature: Double {
        return self.weather.currentTemperature.temperature.value
    }
    
    var tempMin: Double {
        return self.weather.currentTemperature.tempMin.value
    }
    
    var tempMax: Double {
        return self.weather.currentTemperature.tempMax.value
    }
}
