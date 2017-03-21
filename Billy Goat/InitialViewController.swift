//
//  InitialViewController.swift
//  Billy Goat
//
//  Created by Hussle on 3/20/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation
import UIKit

final class InintialViewContoller: UIViewController {
    
    // UI Properties
    @IBOutlet weak var expenseListButton: UIButton!
    
    // ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCalendarButton()
        configureExpenseListButton()
        
        navigationItem.title = "Billy Goat"
    }
    
    private func configureCalendarButton() {
        let calendarButton = UIBarButtonItem(title: "Calendar", style: .plain, target: self, action: #selector(calendarButtonPressed))
        
        navigationItem.rightBarButtonItem = calendarButton
    }
    
    private func configureExpenseListButton() {
        expenseListButton.addTarget(self, action: #selector(expenseListPressed), for: .touchUpInside)
    }
    
    
    // UI Action
    @IBAction func showIncomeList(_ sender: Any) {
        
    }

    // Selector
    func calendarButtonPressed() {
        print("Calendar button pressed")
    }
    
    func expenseListPressed() {
        print("Expense button pressed")
        
    }
    
}
