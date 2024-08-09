//
//  TransferFundsScreen.swift
//  BankApp
//
//  Created by Quang Tran on 8/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import SwiftUI

struct TransferFundsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var transferFundsVM = TransferFundsViewModel()
    @State private var showSheet = false
    @State private var isFromAccount = false
    
    var actionSheetButtons: [Alert.Button] {
        var actionButtons = self.transferFundsVM.filteredAccounts.map { account in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")) {
                if self.isFromAccount {
                    self.transferFundsVM.fromAccount = account
                } else {
                    self.transferFundsVM.toAccount = account
                }
            }
        }
        
        actionButtons.append(.cancel())
        return actionButtons
    }
    
    var body: some View {
        ScrollView {
            VStack {
                AccountListView(accounts: self.transferFundsVM.accounts)
                    .frame(height: 200)
            
                TransferFundsAccountSelectionView(transferFundsVM: self.transferFundsVM, showSheet: self.$showSheet, isFromAccount: self.$isFromAccount)
                Spacer()
                    .onAppear {
                        self.transferFundsVM.populateAccounts()
                    }
        
                Text(self.transferFundsVM.message ?? "")
            
                Button("Submit Transfer") {
                    self.transferFundsVM.submitTransfer {
                        // dismiss the model
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }.padding()
            
                    .actionSheet(isPresented: self.$showSheet) {
                        ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: self.actionSheetButtons)
                    }
            }
        }
        .opacity(transferFundsVM.isLoading ? 0.0 : 1.0)
        .overlay(ProgressView().opacity(transferFundsVM.isLoading ? 1.0 : 0.0))
        .navigationBarTitle("Transfer Funds").embedInNavigationView()
    }
}

struct TransferFundsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferFundsScreen()
    }
}
