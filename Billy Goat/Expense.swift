//
//  Expense.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation

struct Expense {
    
    let name: String
    let company: String
    let money: String
    let dueDate: String
    
    static var fakeData = [
        Expense(name: "Water", company: "Shit", money: "$10.00", dueDate: "14th"),
        Expense(name: "Electric", company: "AEP", money: "$42.48", dueDate: "10th"),
        Expense(name: "Gas", company: "AEP", money: "$22.12", dueDate: "22nd"),
        Expense(name: "Car Payment", company: "Huntington", money: "$200.28", dueDate: "14th")
    ]
}
