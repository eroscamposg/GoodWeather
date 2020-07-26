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
            var weatherModel = vm
            
            weatherModel.weather.currentTemperature.temperature = celciusCalc(weatherModel.weather.currentTemperature.temperature)
            weatherModel.weather.currentTemperature.tempMin = celciusCalc(weatherModel.weather.currentTemperature.tempMin)
            weatherModel.weather.currentTemperature.tempMax = celciusCalc(weatherModel.weather.currentTemperature.tempMax)

            return weatherModel
        })
    }
    
    private func celciusCalc(_ temp: Double) -> Double{
        return (temp - 32) * 5/9
    }
    
    private mutating func toFahrenheit() {
        weatherListViewModel = weatherListViewModel.map({vm in
            var weatherModel = vm
            
            weatherModel.weather.currentTemperature.temperature = fahrenheitCalc(weatherModel.weather.currentTemperature.temperature)
            weatherModel.weather.currentTemperature.tempMin = fahrenheitCalc(weatherModel.weather.currentTemperature.tempMin)
            weatherModel.weather.currentTemperature.tempMax = fahrenheitCalc(weatherModel.weather.currentTemperature.tempMax)

            return weatherModel
         })
    }
    
    private func fahrenheitCalc(_ temp: Double) -> Double{
        return (temp * 9/5) + 32
    }
}

struct WeatherViewModel {
    var weather: Weather
}

extension WeatherViewModel {
    var name: String {
        return self.weather.name.capitalized
    }
    
    var currentTemperature: Double {
        return self.weather.currentTemperature.temperature
    }
    
    var tempMin: Double {
        return self.weather.currentTemperature.tempMin
    }
    
    var tempMax: Double {
        return self.weather.currentTemperature.tempMax
    }
}
