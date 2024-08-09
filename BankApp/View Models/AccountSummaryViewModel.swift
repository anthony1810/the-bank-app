//
//  AccountSummaryViewModel.swift
//  BankApp
//
//  Created by Quang Tran on 14/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import Foundation

class AccountSummaryViewModel: ObservableObject {
    
    private var _accountModels = [Account]()
    
    @Published var accounts: [AccountViewModel] = [AccountViewModel]()
    @Published var isLoading = false
    
    var total: Double {
        _accountModels.map { $0.balance }.reduce(0, +)
    }
    
    func getAllAccounts() {
        isLoading = true
        AccountService.shared.getAllAccounts { result in
            switch result {
                case .success(let accounts):
                    if let accounts = accounts {
                        self._accountModels = accounts
                        DispatchQueue.main.async {
                            self.isLoading = false
                            self.accounts = accounts.map(AccountViewModel.init)
                        }
                    }
                   
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}

class AccountViewModel {
    
    var account: Account
    
    init(account: Account) {
        self.account = account
    }
    
    var name: String {
        account.name
    }
    
    var accountId: String {
        account.id.uuidString
    }
    
    var accountType: String {
        account.accountType.title
    }
    
    var balance: Double {
        account.balance
    }
}
