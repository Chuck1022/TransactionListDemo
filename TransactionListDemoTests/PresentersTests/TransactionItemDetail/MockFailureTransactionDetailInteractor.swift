//
//  MockFailureTransactionDetailInteractor.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockFailureTransactionDetailInteractor: TransactionDetailProtocol {
    
    func getTransactionDetail(for id: String, onCompletion: @escaping (Result<DTOTransactionItemDetail, Error>) -> Void) {
        onCompletion(.failure(BOError(errorMessage: "sorry")))
    }
    
}
