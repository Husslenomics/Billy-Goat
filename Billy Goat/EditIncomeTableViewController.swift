//
//  EditIncomeTableViewController.swift
//  Billy Goat
//
//  Created by Hussle on 4/6/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

protocol EditIncomeTableViewControllerDelegate: class{
    func didPressDone(with income: Income, incomeState: EditIncomeTableViewController.IncomeState)
}

final class EditIncomeTableViewController: UITableViewController {
    
    private var incomeState: IncomeState = .add
    var income: Income?
    
    weak var editIncomeDelegate: EditIncomeTableViewControllerDelegate?
    
    enum IncomeState {
        case edit
        case add
    }
    
    @IBOutlet weak var incomeNameTextField: UITextField!
    @IBOutlet weak var incomeSourceTextField: UITextField!
    @IBOutlet weak var payDayTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incomeState = income != nil ? .edit: .add
        
        guard let income = income else { return }
        
        incomeNameTextField.text = income.name
        incomeSourceTextField.text = income.source
        payDayTextField.text = income.payDay
        amountTextField.text = "\(income.money)"
        
    }
    
    
    @IBAction func didPressCancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func didPressDoneButton(_ sender: UIBarButtonItem) {
        
        income = Income(name: incomeNameTextField.text ?? "", source: incomeSourceTextField.text ?? "", money: Double(payDayTextField.text!) ?? 0, payDay: amountTextField.text ?? "")
        
        guard let income = income else { return }
        
        editIncomeDelegate?.didPressDone(with: income, incomeState: incomeState)
        
        dismiss(animated: true, completion: nil)
    }
}
