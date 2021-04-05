//
//  BOError.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

struct BOError: Error {

    let errorMessage: String
    
}

extension BOError: LocalizedError {
    
    var errorDescription: String? {
        return NSLocalizedString(errorMessage, comment: "")
    }
    
}
