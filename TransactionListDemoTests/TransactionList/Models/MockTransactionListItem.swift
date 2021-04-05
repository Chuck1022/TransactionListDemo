//
//  MockTransactionListItem.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

struct MockTransactionListItem: DTOTransactionListItem {
    
    let id: String
    let text: String
    let transactionDateText: String
    
    static var mockItem: MockTransactionListItem {
        return MockTransactionListItem(id: "1", text: "hi", transactionDateText: "2021-02-22")
    }
    
}
