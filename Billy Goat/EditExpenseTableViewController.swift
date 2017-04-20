//
//  EditExpenseTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import UIKit
import CoreData


protocol EditExpenseTableViewControllerDelegate: class {
    //func didPressDone(with expense: Expense, expenseState: EditExpenseTableViewController.ExpenseState)
}

final class EditExpenseTableViewController: UITableViewController {
    
//    var context: NSManagedObjectContext? {
//        return (UIApplication.shared.delegate as? AppDelegate)?
//            .persistentContainer.viewContext
//    }
    
    // 2. add property observer to set the state that was created in step 1
    private var expenseState: ExpenseState = .add
    //var expense: Expense?

    weak var editExpenseDelegate: EditExpenseTableViewControllerDelegate?
    
    // 1. Create a state tracking with either bool or enum
    enum ExpenseState {
        case edit
        case add
    }
    
    // UIProperties
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var duedateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // check if expen`se exist (use guard let)
//        guard let expense = expense else { return }
//        expenseState = .edit
//        
//        // set each textfield's text property with expense data
//        expenseTextField.text = expense.name
//        companyTextField.text = expense.company
//        duedateTextField.text = expense.dueDate
//        amountTextField.text = "\(expense.money)"
        
    }

    
    // IBACtion
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        // FIXME: form validation
        // remove !
//        expense = Expense(name: expenseTextField.text ?? "", company: companyTextField.text ?? "", money: Double(amountTextField.text!) ?? 0, dueDate: duedateTextField.text ?? "")
//        
//        // 4. You could possible have 2 different delegate or you could pass the state into this delegate method (parameter) and act accordingly in the other view controller. 
//        guard let expense = expense else { return }
//
//        editExpenseDelegate?.didPressDone(with: expense, expenseState: expenseState)
//        
        //guard let context = context else { fatalError("Shit needs to be here.") }
        
        Expense.expense(with: Double(amountTextField.text!) ?? 0, companyName: companyTextField.text ?? "", dueDate: Date(), name: expenseTextField.text ?? "", isReoccuring: false, in: AppDelegate.persistentContainer.viewContext)
        try! AppDelegate.persistentContainer.viewContext.save()
        
        dismiss(animated: true, completion: nil)

    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
   
}

