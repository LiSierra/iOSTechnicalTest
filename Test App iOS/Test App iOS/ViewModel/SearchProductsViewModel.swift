//
//  SearchProductsViewModel.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation

// MARK: - Class for implement view-model search product
class SearchProductsViewModel {
    private var products: [ProductItem] = []
    
    // MARK: - Function to obtain all of the list elements.
    /// - parameter siteId: A string to use identity of the site
    /// - parameter product: A string to use identify of the product
    /// - parameter completion: The completion handler with an optional error
    /// - Parameter Error:Description of any error that might  occur
    func getProducts(_ siteId: String, product: String, completion: @escaping((Error?) -> Void)) {
        let searchProductRepository = SearchProductRepository()
        searchProductRepository.getProductList(siteId, product) { result, error in
            if result.count > 1 {
                self.products.append(contentsOf: result)
                completion(nil)
            }
            
            if error != nil {
                completion(error)
            }
        }
    }
    
    // MARK: - Function to obtain the number of the list elements.
    /// - returns  An int with the item number of the list
    func numberOfRows() -> Int {
        return products.count
    }
    
    // MARK: - Function to obtain an item in the list.
    /// - parameter indexPath: An IndexPath to identify an item in the list
    /// - returns  A struct type ProductItem
    func item(at indexPath: IndexPath) -> ProductItem {
        return products[indexPath.row]
    }
    
    // MARK: - Function to delete all items in the list.
    func removeAll() {
        products.removeAll()
    }
}
