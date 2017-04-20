//
//  IncomeListTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/28/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class IncomeListTableViewController : UITableViewController {
    
//    var context: NSManagedObjectContext? {
//        return (UIApplication.shared.delegate as? AppDelegate)?
//            .persistentContainer.viewContext
//    }
//    
    //fileprivate var tempData = Income.tempData
    
//    instantiating a fetched Results controller to be used on Income class
    
    var fetchedResultsController: NSFetchedResultsController<Income> {
        let fetchRequest: NSFetchRequest<Income> = Income.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Income.date), ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: AppDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultsController.delegate = self
        try! fetchResultsController.performFetch()
        return fetchResultsController
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    // IBAction
    
    @IBAction func didPressAddButton(_ sender: Any) {
        performSegue(withIdentifier: "showAdd", sender: self)
    }
    
    @IBAction func didPressTotal(_ sender: Any) {
//        var totalIncome: Double = 0.0
//        for income in tempData  {
//            totalIncome += income.money
//        }
//        
//        let totalAlert = UIAlertController(title: "Total Income", message: "\(totalIncome)", preferredStyle: .alert)
//        
//        let okAction = UIAlertAction(title: "Cool", style: .default, handler: nil)
//        totalAlert.addAction(okAction)
//        
//        present(totalAlert, animated: true, completion: nil)
//    
//        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeCell", for: indexPath) as! IncomeCell
        
        ///cell.configure(with: tempData[indexPath.row])
        let income = fetchedResultsController.object(at: indexPath)
        cell.configure(with: income)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            print("delete")
//            
//            tempData.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showEdit", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController, let editIncomeVC = navigationController.topViewController as? EditIncomeTableViewController, let identifier = segue.identifier else { return }
        
//        switch identifier {
//        case "showEdit":
//            guard let selectedIncomeIndexPath = tableView.indexPathForSelectedRow else { return }
//            
//            let income = tempData[selectedIncomeIndexPath.row]
//            editIncomeVC.income = income
//            editIncomeVC.editIncomeDelegate = self
//            editIncomeVC.title = "Edit Income"
//            
//        case "showAdd":
//            editIncomeVC.title = "Add Income"
//            editIncomeVC.editIncomeDelegate = self
//            
//        default: break
//        }
    }
}

extension IncomeListTableViewController: EditIncomeTableViewControllerDelegate {
//    func didPressDone(with income: Income, incomeState: EditIncomeTableViewController.IncomeState) {
//        switch incomeState {
//        case .edit:
//            guard let selectedIncomeCell = tableView.indexPathForSelectedRow else { return }
//            tempData.remove(at: selectedIncomeCell.row)
//            tempData.insert(income, at: selectedIncomeCell.row)
//        case .add:
//            tempData.append(income)
//        }
//        tableView.reloadData()
//    }
}

// allowing callback to notify the Incomelist that changes have been made

extension IncomeListTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        tableView.reloadData()
    }
}
