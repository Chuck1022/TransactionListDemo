//
//  ViewController.swift
//  TransactionListDemo
//
//  Created by XUN WANG on 5/04/21.
//

import UIKit

class TransactionListVC: UIViewController, ActivityIndicatorLodable, ErrorViewPresentable {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(TransactionItemCell.self)
            tableView.alpha = 0
        }
    }
    
    lazy var presenter: TransactionListPresenter = TransactionListPresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }


}

extension TransactionListVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rowsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = presenter.getItem(at: indexPath)
        let cell = tableView.dequeueCell(for: TransactionItemCell.self)
        cell.update(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.onSelectItem(at: indexPath)
    }
    
}

extension TransactionListVC: TransactionListPresenterDelegate {
    
    func didChange(title: String) {
        self.title = title
    }
    
    func didStartBackgroundActivity() {
        showActivityIndicator()
    }
    
    func didFinishBackgroundActivity() {
        hideActivityIndicator()
    }
    
    func onUpdateTransactionData(with items: [DTOTransactionListItem]) {
        removeFullScreenErrorView()
        tableView.alpha = 1
        tableView.reloadData()
    }
    
    func onUpdateTransactionDataFailure(error: Error) {
        let errorInfo = UIOErrorInfo.init(error: error) { [weak self] errorView in
            errorView.showActivityIndicator()
            self?.presenter.update {
                errorView.hideActivityIndicator()
            }
        }
        showFullScreen(errorInfo: errorInfo)
    }
    
    func onNavigateDetailPage(with id: String) {
        navigationController?.pushViewController(DetailVC(itemId: id), animated: true)
    }
    
}

