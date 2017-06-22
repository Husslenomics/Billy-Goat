//
//  ExpectedExpensesViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit
import CoreData

class ExpectedExpensesViewController: UITableViewController {
    
    var fetchedResultsController: NSFetchedResultsController<Expense> {
        //guard let context = context else { fatalError("Needs context here") }
        
        let fetchResultsController = NSFetchedResultsController(fetchRequest: Expense.expenseFetchRequest(), managedObjectContext: AppDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsController.delegate = self
        do {
            try fetchResultsController.performFetch()
        } catch {
            print("Failed to fetch")
        }
        
        return fetchResultsController
    }
    
    private var viewContext: NSManagedObjectContext {
        return AppDelegate.persistentContainer.viewContext
    }
    
    //fileprivate var fakeData = Expense.fakeData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // number of rows will eventually be indexPath.rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath) as! ExpenseCell
        
        // Configure the cell...
        let expense = fetchedResultsController.object(at: indexPath)
        cell.configure(with: expense)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("delete")
            
            let expense = fetchedResultsController.object(at: indexPath)
            // You don't need self here. - why not?
            Expense.delete(expense: expense, in: viewContext)
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
            
            //Get expense data for the indexpath
            let expense = fetchedResultsController.object(at: selectedExpenseIndexPath)
            
            
            //  send the data to editExpenseTableVC
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
        guard let fetchedObjects = fetchedResultsController.fetchedObjects else { return }
        
        //       var totalExpense = fetchedObjects.reduce(0, {$0 + $1.amount})
        
        for expense in fetchedObjects {
            totalExpense += expense.amount
        }
        
        let totalAlert = UIAlertController(title: "Total Expenses", message: "Expense total \(totalExpense)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        totalAlert.addAction(okAction)
        
        present(totalAlert, animated: true, completion: nil)
        
    }
}


extension ExpectedExpensesViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
