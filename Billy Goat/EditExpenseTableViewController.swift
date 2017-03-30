//
//  EditExpenseTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import UIKit


protocol EditExpenseTableViewControllerDelegate: class {
    func didPressDone(with expense: Expense)
}

class EditExpenseTableViewController: UITableViewController {
    
    // 2. add property observer to set the state that was created in step 1
    var expense: Expense?
    weak var editExpenseDelegate: EditExpenseTableViewControllerDelegate?
    
    // 1. Create a state tracking with either bool or enum
    
    // UIProperties
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var duedateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check if expense exist (use guard let)
        guard let expense = expense else { return }
        
        // set each textfield's text property with expense data
        expenseTextField.text = expense.name
        companyTextField.text = expense.company
        duedateTextField.text = expense.dueDate
        amountTextField.text = expense.money
        
    }
    
    // IBACtion
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        // FIXME: form validation 

        // 3. Check the state and act accordingly to the state.
        let newExpense = Expense(name: expenseTextField.text ?? "", company: companyTextField.text ?? "", money: amountTextField.text ?? "", dueDate: duedateTextField.text ?? "")
        
        
        // 4. You could possible have 2 different delegate or you could pass the state into this delegate method (parameter) and act accordingly in the other view controller. 
        editExpenseDelegate?.didPressDone(with: newExpense)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
   
}

