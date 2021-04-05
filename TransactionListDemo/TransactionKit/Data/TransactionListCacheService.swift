//
//  TransactionListCacheService.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation
import Cache

final class TransactionListCacheService {
    
    let key = String(describing: TransactionListCacheService.self)
    let storage: Storage<String, [DLTransactionItem]>? = try? Storage<String, [DLTransactionItem]>.init(diskConfig: DiskConfig(name: "transaction"),
                                                                                                    memoryConfig: MemoryConfig(),
                                                                                                    transformer: TransformerFactory.forCodable(ofType: [DLTransactionItem].self))
    
    func getTransactionList() -> [DLTransactionItem]? {
       try? storage?.object(forKey: key)
    }
    
    func save(list: [DLTransactionItem]) {
       try? storage?.setObject(list, forKey: key)
    }
    
}
