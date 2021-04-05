//
//  ErrorViewPresentable.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

protocol ErrorViewPresentable {}

extension ErrorViewPresentable where Self: UIViewController {
    
    private var existingErrorView: ErrorView? {
        return view.subviews.first(where: { $0 is ErrorView }) as? ErrorView
    }
    
    func showFullScreen(errorInfo: UIOErrorInfo) {
        if let existingErrorView = existingErrorView {
            existingErrorView.update(errorInfo: errorInfo)
            view.bringSubviewToFront(existingErrorView)
            return
        }
        let errorView = ErrorView()
        errorView.update(errorInfo: errorInfo)
        view.addSubview(errorView)
        errorView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
    }
    
    func removeFullScreenErrorView() {
        view.subviews.filter { $0 is ErrorView }.forEach { $0.removeFromSuperview() }
    }
    
}
