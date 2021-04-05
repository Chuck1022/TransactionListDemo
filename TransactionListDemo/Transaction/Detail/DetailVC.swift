//
//  DetailVC.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit
import SnapKit

final class DetailVC: UIViewController, ActivityIndicatorLodable, ErrorViewPresentable {
    
    lazy var presenter: DetailPresenter = DetailPresenter(id: id, delegate: self)
    
    lazy var detailView: TransactionDetailView = TransactionDetailView()
    private let id: String
    
    init(itemId: String) {
        id = itemId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailView()
        view.backgroundColor = .white
        presenter.onViewDidLoad()
    }
    
    private func addDetailView() {
        view.addSubview(detailView)
        detailView.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.top.equalTo(view.snp.topMargin).offset(16)
        }
    }

}

extension DetailVC: DetailPresenterDelegate {
    
    func didUpdate(title: String) {
        self.title = title
    }
    
    func didStartBackgroundActivity() {
        showActivityIndicator()
    }
    
    func didFinishBackgroundActivity() {
        hideActivityIndicator()
    }
    
    func didUpdate(with detail: UIOTransactionItemDetail) {
        removeFullScreenErrorView()
        detailView.update(detail: detail)
    }
    
    func didFailToUpdate(with error: Error) {
        let errorInfo = UIOErrorInfo(error: error) { [weak self] errorView in
            errorView.showActivityIndicator()
            self?.presenter.update {
                errorView.hideActivityIndicator()
            }
        }
        showFullScreen(errorInfo: errorInfo)
    }
    
}
