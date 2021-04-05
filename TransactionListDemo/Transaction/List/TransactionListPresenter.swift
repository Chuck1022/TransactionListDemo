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
    
}

final class TransactionListPresenter {
    
    
    
}
