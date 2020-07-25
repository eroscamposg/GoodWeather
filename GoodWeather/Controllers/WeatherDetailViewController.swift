//
//  WeatherDetailViewController.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/25/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var currentTempLabel: UILabel!
    
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVMBindings()
        
        
        // Do any additional setup after loading the view.
        //NON-BINDING WAY
//        if let weatherVM = self.weatherViewModel {
//            self.cityLabel.text = weatherVM.name
//            self.currentTempLabel.text = weatherVM.currentTemperature.formatAsDegree
//            self.minTempLabel.text = weatherVM.tempMin.formatAsDegree
//            self.maxTempLabel.text = weatherVM.tempMax.formatAsDegree
//        }
    }
    
    //BINDING WAY
    func setupVMBindings() {
        if let weatherVM = self.weatherViewModel {
            weatherVM.weather.name.bind(listener: {  self.cityLabel.text = $0 })
            weatherVM.weather.currentTemperature.temperature.bind(listener: { self.currentTempLabel.text = $0.formatAsDegree })
            weatherVM.weather.currentTemperature.tempMin.bind(listener: { self.minTempLabel.text = $0.formatAsDegree })
            weatherVM.weather.currentTemperature.tempMax.bind(listener: { self.maxTempLabel.text = $0.formatAsDegree })
        }
        
        //Change the value after a few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.weatherViewModel?.weather.name.value = "Cindy"
        })
        
    }
}
