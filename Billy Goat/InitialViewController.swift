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
        
        configureCenterView()
        
        navigationItem.title = "Billy Goat"
    }
    
    private func configureCalendarButton() {
        let calendarButton = UIBarButtonItem(title: "Calendar", style: .plain, target: self, action: #selector(calendarButtonPressed))
        
        navigationItem.rightBarButtonItem = calendarButton
    }
    
    private func configureExpenseListButton() {
        expenseListButton.addTarget(self, action: #selector(expenseListPressed), for: .touchUpInside)
    }
    
    private func configureCenterView() {
        
        let centerStack = configureCenterStack()
        let centerLabel = configureCenterLabel()
        let centerButton = configureCenterButton()
       
        centerStack.addArrangedSubview(centerLabel)
        centerStack.addArrangedSubview(centerButton)
        
        view.addSubview(centerStack)
        
        configureCenterStackViewConstraints(stackView: centerStack)
    }
    
    private func configureCenterStack() -> UIStackView {
        let centerStack = UIStackView()
        centerStack.axis = .vertical
        centerStack.distribution = .fillEqually
        centerStack.alignment = .center
        
        return centerStack
    }
    
    private func configureCenterLabel() -> UILabel {
        let label = UILabel()
        label.text = "In the ..."
        label.sizeToFit()
        
        return label
    }
    
    private func configureCenterButton() -> UIButton {
        let centerButton = UIButton(type: .system)
        centerButton.setTitle("Center", for: .normal)
        centerButton.sizeToFit()
        centerButton.addTarget(self, action: #selector(centerButtonPressed), for: .touchUpInside)
        
        return centerButton
    }
    
    
    /// Configure the center stack view of the initialViewController
    ///
    /// - Parameter stackView: stack view to add constraints to.
    private func configureCenterStackViewConstraints(stackView: UIStackView) {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // FIXME: Change constraint after image is inserted
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
    
    
    // UI Action
    @IBAction func showIncomeList(_ sender: Any) {
        print("Income button pressed")
    }
    
    

    // Selector
    func calendarButtonPressed() {
        print("Calendar button pressed")
    }
    
    func expenseListPressed() {
        print("Expense button pressed")
        
    }
    
    func centerButtonPressed() {
        print("Center button pressed")
    }
    
}
