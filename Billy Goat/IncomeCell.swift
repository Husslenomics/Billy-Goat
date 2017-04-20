//
//  IncomeCell.swift
//  Billy Goat
//
//  Created by Hussle on 3/28/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

class IncomeCell : UITableViewCell {
    
    @IBOutlet weak var incomeName: UILabel!
    @IBOutlet weak var incomeSource: UILabel!
    @IBOutlet weak var amountExpected: UILabel!
    @IBOutlet weak var payDay: UILabel!
    
    func configure(with income: Income) {
        incomeName.text = income.name
        incomeSource.text = income.sourceName
        amountExpected.text = "\(income.amount)"
        //payDay.text = income.date
        
    }
    
}

