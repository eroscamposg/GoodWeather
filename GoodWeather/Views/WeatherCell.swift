//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/18/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ vm: WeatherViewModel) {
        self.cityNameLabel.text = vm.weather.name.value
        self.temperatureLabel.text = "\(vm.weather.currentTemperature.temperature.value.formatAsDegree)"
    }
}
