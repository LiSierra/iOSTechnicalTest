//
//  CoordinatorImp.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation
import UIKit

// MARK: - Class for implementing navigation in the app
class CoordinatorImp: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    // MARK: - Function for implementing init navigation.
    func start() {
        let storyboard = UIStoryboard(name: Constant.main, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: Constant.viewController) as! ViewController
        vc.coordinator = self
        vc.sitesViewModel = SitesListViewModel()
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    // MARK: - Function for navigation from sites to  product search.
    /// - parameter site:  A struct type Site.
    func searchScreen(from site: Site) {
        let storyboard = UIStoryboard(name: Constant.main, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: Constant.searchProductsViewController) as! SearchProductsViewController
        vc.coordinator = self
        vc.searchProductsViewModel = SearchProductsViewModel()
        vc.site = site
        navigationController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Function for navigation from product serch to  product detail.
    /// - parameter product: A struct type ProductItem
    func detailScreen(from product: ProductItem) {
        let storyboard = UIStoryboard(name: Constant.main, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: Constant.detailViewController) as! DetailViewController
        vc.product = product
        vc.detailViewModel = DetailViewModel()
        navigationController.pushViewController(vc, animated: true)
    }
   
}
