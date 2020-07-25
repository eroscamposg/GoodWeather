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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.weatherListViewModel.numberOfRowsInSection()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //Can also be done by editing Row Height in the Size Inspector of the Table View in Storyboard
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        // Configure the cell...
        
        cell.configure(weatherVM)
                
        return cell
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
