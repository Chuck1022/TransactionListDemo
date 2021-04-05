//
//  DetailPresenterTests.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import XCTest
@testable import TransactionListDemo

class DetailPresenterTests: XCTestCase {
    
    func test_onViewDidLoad() {
        let e = getExpectation()
        let delegate = MockDetailPresenterDelegate()
        let presenter = DetailPresenter.init(id: "", delegate: delegate, interactor: MockSuccessTransactionDetailInteractor())
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
        XCTAssertEqual(title, "Detail")
        XCTAssertEqual(hasStartedBackgroundActivity, true)
        XCTAssertEqual(hasFinishedBackgroundActivity, true)
    }
    
    func test_update_onSuccess() {
        let e = getExpectation()
        let delegate = MockDetailPresenterDelegate()
        let presenter = DetailPresenter.init(id: "", delegate: delegate, interactor: MockSuccessTransactionDetailInteractor())
        var detail: UIOTransactionItemDetail?
        var updateError: Error?
        delegate.updateItemAction = { item in
            detail = item
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(updateError)
        let mockDetail = UIOTransactionItemDetail(dto: MockTransactionItemDetail())
        XCTAssertEqual(detail, mockDetail)
    }
    
    func test_update_onFailure() {
        let e = getExpectation()
        let delegate = MockDetailPresenterDelegate()
        let presenter = DetailPresenter.init(id: "", delegate: delegate, interactor: MockFailureTransactionDetailInteractor())
        var detail: UIOTransactionItemDetail?
        var updateError: Error?
        delegate.updateItemAction = { item in
            detail = item
        }
        delegate.updateFailedAction = { error in
            updateError = error
        }
        presenter.update {
            e.fulfill()
        }
        waitForExpectation()
        XCTAssertNil(detail)
        XCTAssertEqual(updateError?.localizedDescription, "sorry")
    }

}

