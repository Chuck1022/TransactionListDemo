//
//  UITableView+Dequeuable.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: DequeuableProtocol {
        register(T.self, forCellReuseIdentifier: T.dequeueIdentifier)
    }
    
    func dequeueCell<T: UITableViewCell>(for cellType: T.Type = T.self) -> T where T: DequeuableProtocol {
        guard let cell = dequeueReusableCell(withIdentifier: T.dequeueIdentifier) as? T else {
            fatalError()
        }
        return cell
    }
    
}

