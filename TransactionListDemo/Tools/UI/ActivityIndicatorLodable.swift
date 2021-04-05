//
//  ActivityIndicatorLodable.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit
import SnapKit

protocol ActivityIndicatorLodable {
    
    func showActivityIndicator()
    func hideActivityIndicator()
    
}

extension ActivityIndicatorLodable where Self: UIViewController {
    
    private var activityIndicator: UIActivityIndicatorView? {
        return view.subviews.first(where: { $0 is UIActivityIndicatorView }) as? UIActivityIndicatorView
    }
    
    func showActivityIndicator() {
        if let currentIndicatorView = activityIndicator {
            view.bringSubviewToFront(currentIndicatorView)
            currentIndicatorView.startAnimating()
            return
        }
        let indicatorView = UIActivityIndicatorView.init(style: .large)
        indicatorView.startAnimating()
        indicatorView.hidesWhenStopped = true
        view.addSubview(indicatorView)
        indicatorView.snp.makeConstraints { (make) in
            make.center.equalTo(view)
        }
    }
    
    func hideActivityIndicator() {
        activityIndicator?.stopAnimating()
        activityIndicator?.removeFromSuperview()
    }
    
}

extension UIButton: ActivityIndicatorLodable {
    
    func showActivityIndicator() {
        titleLabel?.alpha = 0
        isEnabled = false
        let activityIndicator = UIActivityIndicatorView.init(style: .medium)
        activityIndicator.startAnimating()
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
    }
    
    func hideActivityIndicator() {
        titleLabel?.alpha = 1
        isEnabled = true
        subviews.filter { $0 is UIActivityIndicatorView }.forEach { $0.removeFromSuperview() }
    }
    
}
