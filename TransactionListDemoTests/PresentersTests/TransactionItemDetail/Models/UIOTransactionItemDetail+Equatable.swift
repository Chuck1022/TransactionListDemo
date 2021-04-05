//
//  UIOTransactionItemDetail+Equatable.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

extension UIOTransactionItemDetail: Equatable {
    
    public static func == (lhs: UIOTransactionItemDetail, rhs: UIOTransactionItemDetail) -> Bool {
        return lhs.amountText == rhs.amountText &&
        lhs.transactionDate == rhs.transactionDate &&
        lhs.summary == rhs.summary &&
        lhs.debit == rhs.debit &&
        lhs.credit == rhs.credit &&
        lhs.gst == rhs.gst
    }
}
