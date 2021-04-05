//
//  TransactionDetailView.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit
import SnapKit

final class TransactionDetailView: UIView {
    
    lazy var nameLabel: UILabel = UILabel()
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 26)
        label.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        label.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        return label
    }()
    
    lazy var gstLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSubviews() {
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(amountLabel)
        addSubview(gstLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
        }
        dateLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        amountLabel.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(self)
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.right.equalTo(gstLabel.snp.left).offset(10)
        }
        gstLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(amountLabel)
            make.right.equalTo(self)
        }
    }
    
    func update(detail: UIOTransactionItemDetail) {
        nameLabel.text = detail.summary
        dateLabel.text = detail.transactionDate
        amountLabel.text = detail.amountText
        amountLabel.textColor = detail.amountTextColor
        gstLabel.isHidden = detail.gst == nil
        if let gst = detail.gst {
            gstLabel.text = gst
        }
    }
    
}
