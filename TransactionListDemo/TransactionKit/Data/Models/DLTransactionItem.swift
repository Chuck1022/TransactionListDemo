//
//  DLTransactionItem.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

struct DLTransactionItem: Codable {
    
    let id: String
    let transactionDate: String
    let summary: String
    let debit: Float
    let credit: Float
    
}
