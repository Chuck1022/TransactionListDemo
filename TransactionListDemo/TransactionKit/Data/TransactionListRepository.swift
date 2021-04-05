//
//  TransactionListRepository.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
import Alamofire


final class TransactionListRepository {
    
    func getTransactionList(onCompletion: @escaping (Result<[DLTransactionItem], Error>) -> Void) {
        if let cachedList = TransactionListCacheService().getTransactionList() {
            onCompletion(.success(cachedList))
            return
        }
        getFromExternalService(onCompletion: onCompletion)
    }
    
    private func getFromExternalService(onCompletion: @escaping (Result<[DLTransactionItem], Error>) -> Void) {
        AF.request("https://60220907ae8f8700177dee68.mockapi.io/api/v1/transactions")
            .responseDecodable(of: [DLTransactionItem].self) { response in
                switch response.result {
                case .success(let items):
                    TransactionListCacheService().save(list: items)
                    onCompletion(.success(items))
                case .failure(let error):
                    onCompletion(.failure(error))
                }
            }
    }
    
}
