//
//  TransactionListPresenterTest.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
import XCTest
@testable import TransactionListDemo

class TransactionListPresenterTest: XCTestCase {
    
    func test_onViewDidLoad() {
        let e = getExpectation()
        let delegate = MockTransactionListPresenterDelegate()
        let presenter = TransactionListPresenter.init(delegate: delegate, interactor: MockSuccessTransactionListInteractor())
        var title: String?
        var hasStartedBackgroundActivity: Bool?
        var hasFinishedBackgroundActivity: Bool?
        delegate.changeTitleAction = { text in
            title = text
        }
        delegate.startBackgroundActivityAction = {
            hasStartedBackgroundActivity = true
        }
        delegate.finishBackgroundActivityAction = {
            hasFinishedBackgroundActivity = true
            e.fulfill()
        }
        presenter.onViewDidLoad()
        waitForExpectation()
        XCTAssertEqual(title, "Transactions")
        XCTAssertEqual(hasStartedBackgroundActivity, true)
        XCTAssertEqual(hasFinishedBackgroundActivity, true)
    }
    
    func test_updateList_onSuccess() {
        let e = getExpectation()
        let delegate = MockTransactionListPresenterDelegate()
        let presenter = TransactionListPresenter.init(delegate: delegate, interactor: MockSuccessTransactionListInteractor())
        var updatedItems: [DTOTransactionListItem] = []
        var updateError: Error?
        delegate.updateItemsAction = { items in
            updatedItems = items
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updateError)
        XCTAssertEqual(updatedItems.count, 1)
        let firstItem = updatedItems.first
        XCTAssertEqual(firstItem?.id, MockTransactionListItem.mockItem.id)
        XCTAssertEqual(firstItem?.text, MockTransactionListItem.mockItem.text)
        XCTAssertEqual(firstItem?.transactionDateText, MockTransactionListItem.mockItem.transactionDateText)
    }
    
    func test_updateList_onFailure() {
        let e = getExpectation()
        let delegate = MockTransactionListPresenterDelegate()
        let presenter = TransactionListPresenter.init(delegate: delegate, interactor: MockFailureTransactionListInteractor())
        var updatedItems: [DTOTransactionListItem]?
        var updateError: Error?
        delegate.updateItemsAction = { items in
            updatedItems = items
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updatedItems)
        XCTAssertEqual(updateError?.localizedDescription, "sorry")
    }
    
    func test_rowsCount() {
        let e = getExpectation()
        let presenter = TransactionListPresenter.init(delegate: MockTransactionListPresenterDelegate(), interactor: MockSuccessTransactionListInteractor())
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertEqual(presenter.rowsCount, 1)
    }
    
    func test_getItemAtIndexPath() {
        let e = getExpectation()
        let presenter = TransactionListPresenter.init(delegate: MockTransactionListPresenterDelegate(), interactor: MockSuccessTransactionListInteractor())
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        let firstItem = presenter.getItem(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(firstItem.id, MockTransactionListItem.mockItem.id)
        XCTAssertEqual(firstItem.text, MockTransactionListItem.mockItem.text)
        XCTAssertEqual(firstItem.transactionDateText, MockTransactionListItem.mockItem.transactionDateText)
    }
    
    func test_onSelectItemAtIndexPath() {
        let e = getExpectation()
        let delegate = MockTransactionListPresenterDelegate()
        let presenter = TransactionListPresenter.init(delegate: delegate, interactor: MockSuccessTransactionListInteractor())
        var itemId: String?
        delegate.navigateAction = { id in
            itemId = id
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        presenter.onSelectItem(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(itemId, MockTransactionListItem.mockItem.id)
    }
    
}
