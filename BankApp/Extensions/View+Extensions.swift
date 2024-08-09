//
//  View+Extensions.swift
//  BankApp
//
//  Created by Quang Tran on 8/07/21
//  Copyright © 2021 Quang Tran. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
    
}
