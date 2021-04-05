//
//  UIOErrorInfo.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

struct UIOErrorInfo {
    
    let error: Error
    let retryAction: ((ErrorView) -> Void)
    
}
