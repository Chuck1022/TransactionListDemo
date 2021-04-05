//
//  TransacationFacadeTest.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import XCTest
@testable import TransactionListDemo

class TransacationFacadeTest: XCTestCase {

    func test_getTransactionList_callBack_onMainThread() {
        TransactionFacade().getTransactionList { _ in
            XCTAssertTrue(Thread.isMainThread)
        }
    }
    
    func test_getTransactionDetail_callBack_onMainThread() {
        TransactionFacade().getTransactionDetail(for: "1") { _ in
            XCTAssertTrue(Thread.isMainThread)
        }
    }
    
    func test_getTransactionList() {
        let e = getExpectation()
        var items: [DTOTransactionListItem]?
        var updateError: Error?
        TransactionFacade().getTransactionList { result in
            switch result {
            case .success(let dtos):
                items = dtos
            case .failure(let error):
                updateError = error
            }
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertEqual(items?.count, 19)
        XCTAssertNil(updateError)
        let firstItem = items?.first
        XCTAssertEqual(firstItem?.id, "1")
        XCTAssertEqual(firstItem?.transactionDateText, "2021-02-02T08:11:16+13:00")
        XCTAssertEqual(firstItem?.text, "Fancy Food Market Auckland")
    }
    
    func test_getTransactionDetail_success() {
        let e = getExpectation()
        var updateError: Error?
        var itemDetail: DTOTransactionItemDetail?
        let id = "19"
        TransactionFacade().getTransactionDetail(for: id) { result in
            switch result {
            case .success(let detail):
                itemDetail = detail
            case .failure(let error):
                updateError = error
            }
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updateError)
        XCTAssertEqual(itemDetail?.id, id)
        XCTAssertEqual(itemDetail?.transactionDate, "2021-02-08T13:10:11+13:00")
        XCTAssertEqual(itemDetail?.summary, "Petrol Station Mangawhai")
        XCTAssertEqual(itemDetail?.debit, 175.18)
        XCTAssertEqual(itemDetail?.credit, 0)
    }

}
