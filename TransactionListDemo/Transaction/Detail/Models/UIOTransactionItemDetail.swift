//
//  UIOTransactionItemDetail.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

struct UIOTransactionItemDetail {
    
    let transactionDate: String
    let summary: String
    let debit: Float
    let credit: Float
    let amountText: String
    let gst: String?
    
    init(dto: DTOTransactionItemDetail) {
        transactionDate = dto.transactionDate
        summary = dto.summary
        debit = dto.debit
        credit = dto.credit
        amountText = dto.amountText
        gst = dto.gst
    }
    
    var amountTextColor: UIColor {
        var color: UIColor = .black
        if debit > 0 {
            color = .red
        }
        if credit > 0 {
            color = .green
        }
        return color
    }
}
