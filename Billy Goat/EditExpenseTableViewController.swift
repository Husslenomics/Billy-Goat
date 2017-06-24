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
    func didPressDone(with expense: Expense, expenseState: EditExpenseTableViewController.ExpenseState)
}

final class EditExpenseTableViewController: UITableViewController {
    
    private var expenseState: ExpenseState = .add
    var expense: Expense?
    fileprivate var date: Date?

    weak var editExpenseDelegate: EditExpenseTableViewControllerDelegate?
    
    enum ExpenseState {
        case edit
        case add
    }
    
    // UIProperties
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var dateCell: ExpenseDateCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // check if expen`se exist (use guard let)
        guard let expense = expense, let date = expense.dueDate as Date? else { return }
        expenseState = .edit
//
//        // set each textfield's text property with expense data
        expenseTextField.text = expense.name
        companyTextField.text = expense.companyName
        amountTextField.text = "\(expense.amount)"
        
        dateCell.date = date
    }

    
    // IBACtion
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        // FIXME: form validation        
        guard let date = self.date else {return}

        Expense.expense(with: Double(amountTextField.text!) ?? 0, companyName: companyTextField.text ?? "", dueDate: date, name: expenseTextField.text ?? "", isReoccuring: false, in: AppDelegate.persistentContainer.viewContext)
        try! AppDelegate.persistentContainer.viewContext.save()
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: UITableViewDelegate/Datasource
extension EditExpenseTableViewController {
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let dateCell = tableView.cellForRow(at: indexPath) as? ExpenseDateCell else { return }
        
        dateCell.dateCellDelegate = self
        
        tableView.beginUpdates()
        dateCell.datePicker.isHidden = !dateCell.datePicker.isHidden
        tableView.endUpdates()
    }
}

// 3. Extension that conforms to ExpenseDateCellDelegate. In here assign the date to date variable.

extension EditExpenseTableViewController: ExpenseDateCellDelegate {
    func expenseDateCell(didSetDate date: Date) {
        self.date = date
    }
    
}

