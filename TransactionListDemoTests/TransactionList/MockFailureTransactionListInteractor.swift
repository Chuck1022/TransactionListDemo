//
//  MockFailureTransactionListInteractor.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockFailureTransactionListInteractor: TransactionListProtocol {
    
    func getTransactionList(onCompletion: @escaping (Result<[DTOTransactionListItem], Error>) -> Void) {
        onCompletion(.failure(BOError(errorMessage: "sorry")))
    }
    
}
