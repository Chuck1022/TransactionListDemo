//
//  XCTestCase+Helper.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import XCTest

extension XCTestCase {
    
    func getExpectation() -> XCTestExpectation {
        return expectation(description: "\(#function).\(Date().timeIntervalSince1970)")
    }
    
    func waitForExpectation(timeout: TimeInterval = 1.0) {
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
}

