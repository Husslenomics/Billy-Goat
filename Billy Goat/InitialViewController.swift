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
    
    // ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCalendarButton()
        
        navigationItem.title = "Billy Goat"
    }
    
    @IBAction func showIncomeList(_ sender: Any) {
    }

    private func configureCalendarButton() {
        let calendarButton = UIBarButtonItem(title: "Calendar", style: .plain, target: self, action: #selector(InintialViewContoller.calendarButtonPressed))
        
        navigationItem.rightBarButtonItem = calendarButton
    }
    
    // Selector
    func calendarButtonPressed() {
        print("Calendar button pressed")
    }
}
