//
//  TransactionListProtocol.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

public protocol TransactionListProtocol {
    
    func getTransactionList(onCompletion: @escaping (Result<[DTOTransactionListItem], Error>) -> Void)
    
}
