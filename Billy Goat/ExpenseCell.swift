//
//  ExpenseCell.swift
//  Billy Goat
//
//  Created by Hussle on 3/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

class ExpenseCell: UITableViewCell {
    
    @IBOutlet weak var expenseName: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dueDate: UILabel!

    
    func configure(with expense: Expense) {
        expenseName.text = expense.name
        companyName.text = expense.companyName
        amountLabel.text = "\(expense.amount)"
        
        //TODO: use DateFormatter to display date
    }
    
}
