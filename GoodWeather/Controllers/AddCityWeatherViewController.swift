//
//  AddCityWeatherViewController.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/18/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import UIKit

class AddCityWeatherViewController: UIViewController {

    private var addCityViewModel = AddCityViewModel()
    //2. DECLARE THE DELEGATE IN THE SENDING CLASS
    var delegate: AddCityDelegate?
    
    
    @IBOutlet weak var cityTextField: BindingTextField! {
        didSet {
            cityTextField.bind(callback: {
                self.addCityViewModel.city = $0
            })
        }
    }
    @IBOutlet weak var stateTextField: BindingTextField! {
        didSet {
            stateTextField.bind(callback: {
                self.addCityViewModel.state = $0
            })
        }

    }
    @IBOutlet weak var zipCodeTextField: BindingTextField! {
        didSet {
            zipCodeTextField.bind(callback: {
                self.addCityViewModel.zip = $0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //3. USE THE DELEGATE IN A CLASS METHOD
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        if let delegate = self.delegate {
            delegate.addCityViewControllerDidClose(controller: self)
        }
    }
    
    @IBAction func saveCityTapped(_ sender: UIButton) {
        print(self.addCityViewModel)
        
        if let city = cityTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=a3f6511e2f922b96d082d8cef533a26a")!
            
            let weatherResource = Resource<Weather>(url: weatherURL, parse: { data in
                
                let weatherVM = try? JSONDecoder().decode(Weather.self, from: data)
                
                return weatherVM
            })
            
            WebService().load(resource: weatherResource, completion: { [weak self] result in
                if let weatherData = result {
                    if let delegate = self?.delegate {
                        let weatherVM = WeatherViewModel(weather: weatherData)
                        delegate.addCityViewControllerDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            })
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
}
