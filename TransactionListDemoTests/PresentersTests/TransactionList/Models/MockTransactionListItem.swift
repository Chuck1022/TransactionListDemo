//
//  MockTransactionListItem.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

struct MockTransactionListItem: DTOTransactionListItem {
    
    let id: String = "1"
    let text: String = "hi"
    let transactionDateText: String = "2021-02-22"
    
}
