//
//  TransactionItemDetailInteractor.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

final class TransactionItemDetailInteractor {
    
    func getTransactionDetail(for id: String, onCompletion: @escaping (Result<BOTransactionItemDetail, Error>) -> Void) {
        TransactionListRepository().getTransactionList { result in
            switch result {
            case .success(let items):
                if let targetItem = items.first(where: { $0.id == id }) {
                    onCompletion(.success(BOTransactionItemDetail(dl: targetItem)))
                } else {
                    onCompletion(.failure(BOError(errorMessage: "Sorry, item for \(id) is not found")))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
