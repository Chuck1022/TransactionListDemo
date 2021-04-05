//
//  DTOTransactionItemDetail.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

public protocol DTOTransactionItemDetail {
    
    var id: String { get }
    var transactionDate: String { get }
    var summary: String { get }
    var debit: Float { get }
    var credit: Float { get }
    var amountText: String { get }
    var gst: String? { get }
    
}
