//
//  TransactionListPresenter.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

protocol TransactionListPresenterDelegate: AnyObject {
    
    func didChange(title: String)
    func didStartBackgroundActivity()
    func didFinishBackgroundActivity()
    func onUpdateTransactionData(with items: [DTOTransactionListItem])
    func onUpdateTransactionDataFailure(error: Error)
    func onNavigateDetailPage(with id: String)
    
}

final class TransactionListPresenter {
    
    private weak var delegate: TransactionListPresenterDelegate?
    private let interactor: TransactionListProtocol
    private(set) var transactions: [DTOTransactionListItem] = []
    
    init(delegate: TransactionListPresenterDelegate, interactor: TransactionListProtocol = TransactionFacade()) {
        self.delegate = delegate
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
        delegate?.didChange(title: "Transactions")
        delegate?.didStartBackgroundActivity()
        update { [weak self] in
            self?.delegate?.didFinishBackgroundActivity()
        }
    }
    
    func update(onCompletion: (() -> Void)?) {
        interactor.getTransactionList { [weak self] result in
            switch result {
            case .success(let items):
                self?.transactions = items
                self?.delegate?.onUpdateTransactionData(with: items)
            case .failure(let error):
                self?.delegate?.onUpdateTransactionDataFailure(error: error)
            }
            onCompletion?()
        }
    }
    
    func onSelectItem(at indexPath: IndexPath) {
        let item = getItem(at: indexPath)
        delegate?.onNavigateDetailPage(with: item.id)
    }
    
    var rowsCount: Int {
        return transactions.count
    }
    
    func getItem(at indexPath: IndexPath) -> DTOTransactionListItem {
        return transactions[indexPath.row]
    }
    
}
