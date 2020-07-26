//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/25/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation
import UIKit

//RESPONSIBLE FOR PROVIDING WEATHER RELATED DATA TO ANY CONTROLLER THAT WANT THAT DATA
class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(_ weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherListViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(self.cellIdentifier) not found")
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.cityNameLabel.text = weatherVM.name
        cell.temperatureLabel.text = weatherVM.currentTemperature.formatAsDegree
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
}
