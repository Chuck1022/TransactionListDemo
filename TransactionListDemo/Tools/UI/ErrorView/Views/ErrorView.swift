//
//  ErrorView.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit
import SnapKit

class ErrorView: UIView {
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var retryButton: UIButton = {
        let buttton = UIButton(type: .custom)
        buttton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 100, height: 50))
        }
        buttton.setTitle("Retry", for: .normal)
        buttton.setTitleColor(.blue, for: .normal)
        buttton.layer.borderColor = UIColor.blue.cgColor
        buttton.layer.borderWidth = 2
        buttton.layer.cornerRadius = 4
        buttton.addTarget(self, action: #selector(onRetryButtonClicked), for: .touchUpInside)
        return buttton
    }()
    
    private var errorInfo: UIOErrorInfo?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configView()
    }
    
    func configView() {
        backgroundColor = .white
        addSubview(label)
        addSubview(retryButton)
        retryButton.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        label.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(retryButton.snp.top).offset(-16)
        }
    }
    
    func update(errorInfo: UIOErrorInfo) {
        self.errorInfo = errorInfo
        label.text = errorInfo.error.localizedDescription
    }
    
    func showActivityIndicator() {
        retryButton.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        retryButton.hideActivityIndicator()
    }
    
    @objc private func onRetryButtonClicked() {
        errorInfo?.retryAction(self)
    }
    
}
