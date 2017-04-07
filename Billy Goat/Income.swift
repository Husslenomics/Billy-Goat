//
//  Income.swift
//  Billy Goat
//
//  Created by Hussle on 3/28/17.
//  Copyright © 2017 Husslenomics. All rights reserved.
//

import Foundation

struct Income {
    
    let name : String
    let source : String
    let money : Double
    let payDay : String
    
    static var tempData = [
    
        Income(name: "PayCheck", source: "Apple:", money: 806.58, payDay: "14"),
        Income(name: "Misc", source: "Buds", money: 150, payDay: "7")
    ]
    
}
