//
//  TransactionFacade.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

final class TransactionFacade: TransactionProtocol {}

extension TransactionFacade: TransactionListProtocol {
    
    func getTransactionList(onCompletion: @escaping (Result<[DTOTransactionListItem], Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            TransactionListInteractor().getTransactionList { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let items):
                        onCompletion(.success(items))
                    case .failure(let error):
                        onCompletion(.failure(error))
                    }
                }
            }
        }
    }
    
}

extension TransactionFacade: TransactionDetailProtocol {
    
    func getTransactionDetail(for id: String, onCompletion: @escaping (Result<DTOTransactionItemDetail, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            TransactionItemDetailInteractor().getTransactionDetail(for: id) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let detail):
                        onCompletion(.success(detail))
                    case .failure(let error):
                        onCompletion(.failure(error))
                    }
                }
            }
        }
    }
    
}
