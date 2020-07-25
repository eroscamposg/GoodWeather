//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/24/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    private var settingsViewModel = SettingsViewModel()
    var delegate: SettingsDelegate?
    var originalUnit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalUnit = settingsViewModel.selectedUnit.rawValue
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsViewModel.units.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let settingsItem = settingsViewModel.units[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        // Configure the cell...
        
        if settingsItem == settingsViewModel.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        cell.textLabel?.text = settingsItem.displayName
        
        return cell
    }
    
    // MARK: - Selected Cells
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        //Uncheck all cells
        tableView.visibleCells.forEach({ cell in
            cell.accessoryType = .none
        })
        
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsViewModel.selectedUnit = unit
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }

    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        //If the user hasnt changed the units, dont do anything
        if settingsViewModel.selectedUnit.rawValue != originalUnit, let delegate = self.delegate {
            delegate.settingsDone(vm: self.settingsViewModel)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
}
