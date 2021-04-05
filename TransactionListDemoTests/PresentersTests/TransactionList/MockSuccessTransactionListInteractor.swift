//
//  MockTransactionListInteractor.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockSuccessTransactionListInteractor: TransactionListProtocol {
    
    func getTransactionList(onCompletion: @escaping (Result<[DTOTransactionListItem], Error>) -> Void) {
        onCompletion(.success([MockTransactionListItem()]))
    }
    
}
