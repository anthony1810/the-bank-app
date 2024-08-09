//
//  TransferAccountFund.swift
//  BankApp
//
//  Created by Quang Tran on 8/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import Foundation


struct TransferFundRequest: Codable {
    
    let accountFromId: String
    let accountToId: String
    let amount: Double 
    
}
