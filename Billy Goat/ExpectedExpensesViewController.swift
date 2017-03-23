//
//  ExpectedExpensesViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

class ExpectedExpensesViewController: UITableViewController {
    
    private let fakeData = Expense.fakeData

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
 
    // number of rows will eventually be indexPath.rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        
        // Configure the cell...
        cell.configure(with: fakeData[indexPath.row])
        return cell
    }
}
