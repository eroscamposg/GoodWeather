//
//  GenericDataSource.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/26/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else {
            fatalError("Error gettin \(cellIdentifier)")
        }
        
        let vm = items[indexPath.row]
        self.configureCell(cell, vm)
        
        return cell
    }
    
    let cellIdentifier: String
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, items: [ViewModel], _ configureCell: @escaping (CellType, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
}
