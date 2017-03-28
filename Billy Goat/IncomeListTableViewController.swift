//
//  IncomeListTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/28/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import UIKit

class IncomeListTableViewController : UITableViewController {
    
    fileprivate var tempData = Income.tempData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath) as! IncomeCell
        
        cell.configure(with: tempData[indexPath.row])
        return cell
    }
    
    
   
    
}
