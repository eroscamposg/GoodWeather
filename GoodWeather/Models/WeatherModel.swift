//
//  WeatherModel.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/24/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let name: String
    let currentTemperature: TemperatureModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureModel: Codable {
    let temperature: Double
    let tempMin, tempMax: Double

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }}
