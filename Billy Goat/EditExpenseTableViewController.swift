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
    
    weak var editExpenseDelegate: EditExpenseTableViewControllerDelegate?
    
    // UIProperties
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var duedateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    // IBACtion
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        // FIXME: form validation 

        let newExpense = Expense(name: expenseTextField.text ?? "", company: companyTextField.text ?? "", money: amountTextField.text ?? "", dueDate: duedateTextField.text ?? "")
        
        editExpenseDelegate?.didPressDone(with: newExpense)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}

