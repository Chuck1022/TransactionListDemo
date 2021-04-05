//
//  TransactionDetailProtocol.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

public protocol TransactionDetailProtocol {
    
    func getTransactionDetail(for id: String, onCompletion: @escaping (Result<DTOTransactionItemDetail, Error>) -> Void)
    
}
