//
//  ExpectedExpensesViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

class ExpectedExpensesViewController: UITableViewController {
    
    fileprivate var fakeData = Expense.fakeData

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // reduce indentation and force unwrapping by using guard.
//        if segue.identifier == "showEdit" {
//            let controller = segue.destination as! UINavigationController
//            let firstV = controller.viewControllers[0] as! EditExpenseTableViewController
//            firstV.editExpenseDelegate = self
//
//        }
        
        guard segue.identifier == "showEdit" else { return }
        guard let navigationController = segue.destination as? UINavigationController, let editExpenseTableVC = navigationController.topViewController as? EditExpenseTableViewController else { return }
        
        editExpenseTableVC.editExpenseDelegate = self
    }
}

extension ExpectedExpensesViewController: EditExpenseTableViewControllerDelegate {
    func didPressDone(with expense: Expense) {
        fakeData.append(expense)
        tableView.reloadData()
    }
}
