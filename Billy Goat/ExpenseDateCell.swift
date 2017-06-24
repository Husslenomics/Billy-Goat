//
//  ExpenseDateCell.swift
//  Billy Goat
//
//  Created by Hussle on 6/22/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import UIKit

protocol ExpenseDateCellDelegate: class {
    func expenseDateCell(didSetDate date: Date)
}

final class ExpenseDateCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    
    var date: Date? {
        didSet {
            guard let date = date else { return }
            dateLabel.text = dateFormatter.string(from: date)
            dateLabel.isHidden = false
        }
    }

    // 1. create weak var delegate that is of type what ever you name the protocol
    
    weak var dateCellDelegate: ExpenseDateCellDelegate?
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dateLabel.isHidden = true
        datePicker.isHidden = true
        
        datePicker.addTarget(self, action: #selector(dateValueChanged), for: .valueChanged)
    }
    
    func dateValueChanged(sender: UIDatePicker) {
        let dateString = dateFormatter.string(from: sender.date)
        dateLabel.isHidden = false
        dateLabel.text = dateString
        
        dateCellDelegate?.expenseDateCell(didSetDate: sender.date)
    }
}

// Create delegation pattern to communicate back to EditExpenseTableViewController.
