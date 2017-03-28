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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
    
            // You don't need self here. - why not?
            fakeData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Sender should just be self - fixed
        performSegue(withIdentifier: "showEdit", sender: self)
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
