//
//  TransactionItemCell.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

final class TransactionItemCell: UITableViewCell, DequeuableProtocol {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: reuseIdentifier)
        configViewAccessoryType()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configViewAccessoryType()
    }
    
    private func configViewAccessoryType() {
        accessoryType = .disclosureIndicator
    }
    
    func update(item: DTOTransactionListItem) {
        textLabel?.text = item.text
        detailTextLabel?.text = item.transactionDateText
    }
    
}
