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
        
        //NON-BINDING WAY
        if let weatherVM = self.weatherViewModel {
            self.cityLabel.text = weatherVM.name
            self.currentTempLabel.text = weatherVM.currentTemperature.formatAsDegree
            self.minTempLabel.text = weatherVM.tempMin.formatAsDegree
            self.maxTempLabel.text = weatherVM.tempMax.formatAsDegree
        }
    }
}
