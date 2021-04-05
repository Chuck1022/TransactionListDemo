//
//  TransactionListInteractor.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

final class TransactionListInteractor {
    
    func getTransactionList(onCompletion: @escaping (Result<[BOTransactionListItem], Error>) -> Void) {
        TransactionListRepository().getTransactionList { result in
            switch result {
            case .success(let items):
                let boItems = items.compactMap { BOTransactionListItem(dl: $0) }.sorted(by: <)
                onCompletion(.success(boItems))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
    
}
