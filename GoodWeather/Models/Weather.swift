//
//  WeatherModel.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/24/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

//CODING KEYS used to name the varialbes different than the ones from the API
struct Weather: Decodable {
    var name: String
    var currentTemperature: Temperature
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct Temperature: Decodable {
    var temperature: Double
    var tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }}

