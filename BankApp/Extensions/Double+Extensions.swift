//
//  Double+Extensions.swift
//  BankApp
//
//  Created by Quang Tran on 8/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
    
}
