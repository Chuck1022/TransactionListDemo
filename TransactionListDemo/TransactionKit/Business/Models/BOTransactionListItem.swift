//
//  BOTransactionListItem.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

struct BOTransactionListItem: DTOTransactionListItem {
    
    let id: String
    let text: String
    let transactionDateText: String
    let transactionDate: Date
    
    init?(dl: DLTransactionItem) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        guard let transactionDate = formatter.date(from: dl.transactionDate) else { return nil }
        id = dl.id
        text = dl.summary
        self.transactionDate = transactionDate
        transactionDateText = dl.transactionDate
    }
    
}

extension BOTransactionListItem: Comparable {
    
    static func < (lhs: BOTransactionListItem, rhs: BOTransactionListItem) -> Bool {
        return lhs.transactionDate < rhs.transactionDate
    }
    
}


