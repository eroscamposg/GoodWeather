//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/18/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import UIKit

//4. INHERIT THE PROTOCOL IN THE RECEIVING CLASS
class WeatherListTableViewController: UITableViewController, AddCityDelegate, SettingsDelegate {
    //MARK: - DELEGATES
    //5. IMPLEMENT THE DELEGATE METHODS
    func addCityViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addCityViewControllerDidSave(vm: WeatherViewModel) {
        print("NAME: \(vm.weather.name)")
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    func settingsDone(vm: SettingsViewModel) {
        weatherListViewModel.updateUnit(to: vm.selectedUnit)
        tableView.reloadData()
    }

    private var weatherListViewModel = WeatherListViewModel()
    private var dataSource: WeatherDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Data Source Init
        self.dataSource = WeatherDataSource(self.weatherListViewModel)
        self.tableView.dataSource = self.dataSource
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Can also be done by editing Row Height in the Size Inspector of the Table View in Storyboard
        return 100
    }
        
    // MARK: - Navigation

    //6. SET THE DELEGATE IN THE PrepareSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddCitySegue" {
            guard let navC = segue.destination as? UINavigationController, let addCityVC = navC.viewControllers.first as? AddCityWeatherViewController else {
                fatalError("Error performing segue")
            }
            addCityVC.delegate = self
        
        } else if segue.identifier == "SettingsSegue"{
            guard let navC = segue.destination as? UINavigationController, let settingsVC = navC.viewControllers.first as? SettingsTableViewController else {
                fatalError("Error performing segue")
            }
            settingsVC.delegate = self
            
        } else if segue.identifier == "WeatherDetailSegue" {
            guard let weatherDetailVC = segue.destination as? WeatherDetailViewController, let indexPath = self.tableView.indexPathForSelectedRow else {
                fatalError("Error performing segue")
            }
            
            let weatherVM = weatherListViewModel.modelAt(indexPath.row)
            
            weatherDetailVC.weatherViewModel = weatherVM
            
        }
    }
}
