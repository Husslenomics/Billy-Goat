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

    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    func configure(with expense: Expense) {
        expenseName.text = expense.name
        companyName.text = expense.companyName
        amountLabel.text = "\(expense.amount)"
        guard let dueDate = expense.dueDate as Date? else { return }
        self.dueDate.text = dateFormatter.string(from: dueDate)
        
    }
}
