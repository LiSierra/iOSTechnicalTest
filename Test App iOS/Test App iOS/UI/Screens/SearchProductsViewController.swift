//
//  SearchProductsViewController.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation
import UIKit

// MARK: - Class for implement view search product
class SearchProductsViewController: BaseViewController {
    
    @IBOutlet weak var seProduct: UISearchBar!    
    @IBOutlet weak var tvProducts: UITableView!
    
    var coordinator: CoordinatorImp?
    var site: Site?
    var searchProductsViewModel: SearchProductsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupSearchBar()
        setupTableView()
    }
    
    // MARK: - Function for setup the table view
    private func setupTableView() {
        self.tvProducts.separatorStyle = .none
        self.tvProducts.delegate = self
        self.tvProducts.dataSource = self
        Utility.registerCells(tableView: tvProducts, isSite: false)
    }
    
    // MARK: - Function for setup the search bar
    private func setupSearchBar() {
        self.seProduct.delegate = self
        self.seProduct.placeholder = Constant.placeholder
    }
}

// MARK: - Implement UITableViewDelegate
extension SearchProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seProduct.resignFirstResponder()
        let product = searchProductsViewModel?.item(at: indexPath)
        coordinator?.detailScreen(from: product ?? ProductItem())
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        seProduct.resignFirstResponder()
    }
}

// MARK: - Implement UITableViewDataSource
extension SearchProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchProductsViewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Utility.getProductCell(to: indexPath, tableView: tableView)
        cell.configure(searchProductsViewModel?.item(at: indexPath) ?? ProductItem())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: - Implement UISearchBarDelegate
extension SearchProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadingView(true)
        let value = searchBar.text ?? Constant.empty
        searchProductsViewModel?.removeAll()
        self.tvProducts.reloadData()
        searchBar.text = Constant.empty
        searchProductsViewModel?.getProducts(site?.id ?? Constant.empty, product: value) { error in
            if error != nil {
                self.loadingView(false)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showSimpleAlert()
                }
            } else {
                self.tvProducts.reloadData()
                self.loadingView(false)
            }
        }
        searchBar.resignFirstResponder()
    }
}
