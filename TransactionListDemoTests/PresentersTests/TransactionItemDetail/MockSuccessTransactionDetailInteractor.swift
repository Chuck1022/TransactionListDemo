//
//  MockSuccessTransactionDetailInteractor.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockSuccessTransactionDetailInteractor: TransactionDetailProtocol {
    
    func getTransactionDetail(for id: String, onCompletion: @escaping (Result<DTOTransactionItemDetail, Error>) -> Void) {
        onCompletion(.success(MockTransactionItemDetail()))
    }
    
}
