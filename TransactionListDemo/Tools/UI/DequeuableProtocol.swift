//
//  DequeuableProtocol.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

protocol DequeuableProtocol {
    
    static var dequeueIdentifier: String { get }
    
}

extension DequeuableProtocol where Self: UITableViewCell {
    
    static var dequeueIdentifier: String {
        return NSStringFromClass(self)
    }
    
}
