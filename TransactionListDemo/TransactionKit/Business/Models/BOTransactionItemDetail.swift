//
//  BOTransactionItemDetail.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import Foundation

struct BOTransactionItemDetail: DTOTransactionItemDetail {
    
    let id: String
    let transactionDate: String
    let summary: String
    let debit: Float
    let credit: Float
    var amountText: String {
        var text: String = ""
        if debit > 0 {
            text = "-$\(debit.stringByRemovingTrailingZeros)"
        }
        if credit > 0 {
            text = "+$\(credit.stringByRemovingTrailingZeros)"
        }
        return text
    }
    
    var gst: String? {
        guard debit > 0 else {
            return nil
        }
        let gst: Float = debit/1.15 * 0.15
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        let gstNumber = NSNumber(value: gst)
        return "include GST: $\(formatter.string(from: gstNumber) ?? gst.stringByRemovingTrailingZeros)"
    }
    
    init(dl: DLTransactionItem) {
        id = dl.id
        transactionDate = dl.transactionDate
        summary = dl.summary
        debit = dl.debit
        credit = dl.credit
    }
    
}

extension Float {
    
    var stringByRemovingTrailingZeros: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
}
