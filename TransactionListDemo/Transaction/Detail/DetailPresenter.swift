//
//  DetailPresenter.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

protocol DetailPresenterDelegate: AnyObject {
    
    func didStartBackgroundActivity()
    func didFinishBackgroundActivity()
    func didUpdate(title: String)
    func didUpdate(with detail: UIOTransactionItemDetail)
    func didFailToUpdate(with error: Error)
    
}

final class DetailPresenter {
    
    private weak var delegate: DetailPresenterDelegate?
    private let interactor: TransactionDetailProtocol
    private let id: String
    
    init(id: String,
         delegate: DetailPresenterDelegate,
         interactor: TransactionDetailProtocol = TransactionFacade()) {
        self.id = id
        self.delegate = delegate
        self.interactor = interactor
    }
    
    func onViewDidLoad() {
        delegate?.didUpdate(title: "Detail")
        delegate?.didStartBackgroundActivity()
        update { [weak self] in
            self?.delegate?.didFinishBackgroundActivity()
        }
    }
    
    func update(onCompletion: (() -> Void)?) {
        interactor.getTransactionDetail(for: id) { [weak self] result in
            switch result {
            case .success(let item):
                self?.delegate?.didUpdate(with: UIOTransactionItemDetail(dto: item))
            case .failure(let error):
                self?.delegate?.didFailToUpdate(with: error)
            }
            onCompletion?()
        }
    }
    
}
