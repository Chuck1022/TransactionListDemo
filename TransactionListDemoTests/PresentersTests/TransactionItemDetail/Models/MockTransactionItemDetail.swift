//
//  MockTransactionItemDetail.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

struct MockTransactionItemDetail: DTOTransactionItemDetail {
    
    let id: String = "1"
    let transactionDate: String = "date"
    let summary: String = "summary"
    let debit: Float = 34
    let credit: Float = 0
    let amountText: String = "amountText"
    let gst: String? = nil
    
}
