//
//  MockDetailPresenterDelegate.swift
//  TransactionListDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockDetailPresenterDelegate: DetailPresenterDelegate {
    
    var changeTitleAction: ((String) -> Void)?
    var startBackgroundActivityAction: (() -> Void)?
    var finishBackgroundActivityAction: (() -> Void)?
    var updateItemAction: ((UIOTransactionItemDetail) -> Void)?
    var updateFailedAction: ((Error) -> Void)?
    
    func didStartBackgroundActivity() {
        startBackgroundActivityAction?()
    }
    
    func didFinishBackgroundActivity() {
        finishBackgroundActivityAction?()
    }
    
    func didUpdate(title: String) {
        changeTitleAction?(title)
    }
    
    func didUpdate(with detail: UIOTransactionItemDetail) {
        updateItemAction?(detail)
    }
    
    func didFailToUpdate(with error: Error) {
        updateFailedAction?(error)
    }
    
}
