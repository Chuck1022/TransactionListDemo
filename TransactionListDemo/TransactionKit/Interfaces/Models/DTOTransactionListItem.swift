//
//  DTOTransactionListItem.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

public protocol DTOTransactionListItem {
    
    var id: String { get }
    var text: String { get }
    var transactionDateText: String { get }
    
}
