//
//  SitesListViewModel.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation

// MARK: - Class for implement view-model sites
class SitesListViewModel {
    private var sites:[Site] = []
    
    // MARK: - Function to obtain all of the list elements.
    /// - parameter completion: The completion handler with an optional error
    /// - Parameter Error:Description of any error that might  occur
    func loadSites(completion: @escaping((Error?) -> Void)) {
        let sitesRepository = SitesRepository()
        sitesRepository.getSiteList { result, error in
            if result.count > 1 {
                self.sites.append(contentsOf: result)
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
        return sites.count
    }
    
    // MARK: - Function to obtain an item in the list.
    /// - parameter indexPath: An IndexPath to identify an item in the list
    /// - returns  A struct type Site
    func item(at indexPath: IndexPath) -> Site {
        return sites[indexPath.row]
    }
}
