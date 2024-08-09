//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Quang Tran on 8/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import SwiftUI

enum ActiveSheet {
    case addAccount
    case transferFunds
}

struct AccountSummaryScreen: View {
    
    @StateObject private var accountSummaryVM = AccountSummaryViewModel()
    
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    var body: some View {
        VStack {
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: self.accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(self.accountSummaryVM.total.formatAsCurrency())")
                    Spacer()
                    Button("Transfer Funds") {
                        self.activeSheet = .transferFunds
                        self.isPresented = true
                    }
                }
            }
        }
        .opacity(accountSummaryVM.isLoading ? 0.0 : 1.0)
        .overlay(ProgressView().opacity(accountSummaryVM.isLoading ? 1.0 : 0.0))
        .onAppear {
                self.accountSummaryVM.getAllAccounts()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Button("Add Account") {
                    self.activeSheet = .addAccount
                    self.isPresented = true
                }
            })
        }
        .sheet(
            isPresented: $isPresented,
            onDismiss: self.accountSummaryVM.getAllAccounts,
            content: {
                if activeSheet == .transferFunds {
                    TransferFundsScreen()
                } else {
                    AddAccountScreen()
                }
            })
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

struct AccountSummaryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountSummaryScreen()
    }
}
