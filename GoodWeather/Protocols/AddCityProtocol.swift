//
//  AddCityProtocol.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/18/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation
import UIKit

//1. CREATE THE PROTOCOL

//Protocols to notify the controller that the windows was close
protocol AddCityDelegate {
    //func addCityViewControllerDidSave(order: Order, controller: UIViewController)
    func addCityViewControllerDidClose(controller: UIViewController)
    func addCityViewControllerDidSave(vm: WeatherViewModel)
}


