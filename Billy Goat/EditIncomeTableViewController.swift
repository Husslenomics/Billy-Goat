//
//  EditIncomeTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 4/6/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

protocol EditIncomeTableViewControllerDelegate: class{
    //func didPressDone(with income: Income, incomeState: EditIncomeTableViewController.IncomeState)
}

final class EditIncomeTableViewController: UITableViewController {
    
    private var incomeState: IncomeState = .add
    var income: Income?
    
    weak var editIncomeDelegate: EditIncomeTableViewControllerDelegate?
    
    var datePickerVisible = false
    
    enum IncomeState {
        case edit
        case add
    }
    
    @IBOutlet weak var incomeNameTextField: UITextField!
    @IBOutlet weak var incomeSourceTextField: UITextField!
    @IBOutlet weak var payDayTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var datePickerCell: UITableViewCell!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    func showDatePicker() {
        datePickerVisible = true
        let indexPathDatePicker = IndexPath(row: 3, section: 0)
        tableView.insertRows(at: [indexPathDatePicker], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 3 {
            return datePickerCell
        } else {
            return super.tableView(tableView, cellForRowAt: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                           numberOfRowsInSection section: Int) -> Int {
        if section == 0 && datePickerVisible {
            return 4
        } else {
            return super.tableView(tableView, numberOfRowsInSection: section)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //textField.resignFirstResponder()
        if indexPath.section == 0 && indexPath.row == 2 {
            showDatePicker()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if income != nil {
//            incomeState = .edit
//        } else {
//            incomeState = .add
//        }
        
        incomeState = income != nil ? .edit: .add
        
        guard let income = income else { return }
        
        incomeNameTextField.text = income.name
        incomeSourceTextField.text = income.sourceName
        payDayTextField.text = "\(income.date)"
        amountTextField.text = "\(income.amount)"
        
    }
    
    
    @IBAction func didPressCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
//    filled in the income object with the text field input and saved to context when done is pressed
    @IBAction func didPressDoneButton(_ sender: UIBarButtonItem) {
        
//        income = Income(name: incomeNameTextField.text ?? "", source: incomeSourceTextField.text ?? "", money: Double(payDayTextField.text!) ?? 0, payDay: amountTextField.text ?? "")
//        
//        guard let income = income else { return }
//        
//        editIncomeDelegate?.didPressDone(with: income, incomeState: incomeState)
//        
//        dismiss(animated: true, completion: nil)
        
        switch incomeState {
        case .add:
            // FIXME: remove ! and clean up viewContext
            Income.income(with: Double(amountTextField.text!) ?? 0, sourceName: incomeSourceTextField.text ?? "", name: incomeNameTextField.text ?? "", date: Date(), isReoccuring: false, in: AppDelegate.persistentContainer.viewContext)
            try! AppDelegate.persistentContainer.viewContext.save()
        case .edit:
            income?.name = incomeNameTextField.text
            income?.sourceName = incomeSourceTextField.text
            income?.date = NSDate()
            income?.amount = Double(amountTextField.text ?? "0") ?? 0
            try! AppDelegate.persistentContainer.viewContext.save()
        }
        
         dismiss(animated: true, completion: nil)
    }
}
