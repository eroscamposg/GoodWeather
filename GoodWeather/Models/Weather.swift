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
    var name: Dynamic<String>
    var currentTemperature: Temperature
    
    //TO BE ABLE TO DECODE - MANUAL DECODING
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(Temperature.self, forKey: .currentTemperature)
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct Temperature: Decodable {
    var temperature: Dynamic<Double>
    var tempMin, tempMax: Dynamic<Double>

    //TO BE ABLE TO DECODE - MANUAL DECODING
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temperature = Dynamic(try container.decode(Double.self, forKey: .temperature))
        tempMin = Dynamic(try container.decode(Double.self, forKey: .tempMin))
        tempMax = Dynamic(try container.decode(Double.self, forKey: .tempMax))
    }

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }}

//Type Eraser
class Dynamic<T>: Decodable where T: Decodable {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T {
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    
    init (_ value: T) {
        self.value = value
    }
    
    private enum CodingKeys: CodingKey {
        case value
    }
    
}

