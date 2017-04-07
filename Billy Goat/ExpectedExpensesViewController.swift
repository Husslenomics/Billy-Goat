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
        
        //    guard segue.identifier == "showAdd" else { return }
        //  guard let navigationController = segue.destination as? UINavigationController, let editExpenseTableVC = navigationController.topViewController as? EditExpenseTableViewController else { return }
        
        
        //editExpenseTableVC.editExpenseDelegate = self
        
        guard let navigationController = segue.destination as? UINavigationController, let editExpenseTableVC = navigationController.topViewController as? EditExpenseTableViewController, let identifier = segue.identifier else { return }
        
        
        switch identifier {
        case "showEdit":
            // Find out index Path
            guard let selectedExpenseIndexPath = tableView.indexPathForSelectedRow else { return }
        
            // Get expense data for the indexpath
            let expense = fakeData[selectedExpenseIndexPath.row]
            
            // send the data to editExpenseTableVC
            editExpenseTableVC.expense = expense
            editExpenseTableVC.editExpenseDelegate = self
            editExpenseTableVC.title = "Edit Expense"
            
        case "showAdd":
            editExpenseTableVC.editExpenseDelegate = self
            editExpenseTableVC.title = "Add Expense"
            
        default: break
        }
        
    }
    @IBAction func totalButtonPressed(_ sender: Any) {
        var totalExpense: Double = 0.0
        for expense in fakeData {
            totalExpense += expense.money
        }
        
        let totalAlert = UIAlertController(title: "Total Expenses", message: "Expense total \(totalExpense)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        totalAlert.addAction(okAction)
        
        present(totalAlert, animated: true, completion: nil)
        
    }
}

extension ExpectedExpensesViewController: EditExpenseTableViewControllerDelegate {
    func didPressDone(with expense: Expense, expenseState: EditExpenseTableViewController.ExpenseState) {
        // 5. depending on the state either append or insert at certain indexPath. 
        switch expenseState {
        case .edit:
            guard let indexPathForSelectedRow = tableView.indexPathForSelectedRow else { return }
            fakeData.remove(at: indexPathForSelectedRow.row)
            fakeData.insert(expense, at: indexPathForSelectedRow.row)
        case .add:
            fakeData.append(expense)
        }
        tableView.reloadData()
    }
}
