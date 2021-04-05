//
//  MockTransactionListPresenterDelegate.swift
//  TransactionDemoTests
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
@testable import TransactionListDemo

final class MockTransactionListPresenterDelegate: TransactionListPresenterDelegate {
    
    var changeTitleAction: ((String) -> Void)?
    var startBackgroundActivityAction: (() -> Void)?
    var finishBackgroundActivityAction: (() -> Void)?
    var updateItemsAction: (([DTOTransactionListItem]) -> Void)?
    var updateFailedAction: ((Error) -> Void)?
    var navigateAction: ((String) -> Void)?
    
    func didChange(title: String) {
        changeTitleAction?(title)
    }
    
    func didStartBackgroundActivity() {
        startBackgroundActivityAction?()
    }
    
    func didFinishBackgroundActivity() {
        finishBackgroundActivityAction?()
    }
    
    func onUpdateTransactionData(with items: [DTOTransactionListItem]) {
        updateItemsAction?(items)
    }
    
    func onUpdateTransactionDataFailure(error: Error) {
        updateFailedAction?(error)
    }
    
    func onNavigateDetailPage(with id: String) {
        navigateAction?(id)
    }
    
    
}
