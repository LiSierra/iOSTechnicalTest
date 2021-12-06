//
//  DetailViewModel.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation

// MARK: - Class for implement view-model detail product
class DetailViewModel {
    
    // MARK: - Function to obtain the detailed data of the product.
    /// - parameter id: A string to use identity of the product
    /// - parameter completion: The completion handler with Detail data and optional error
    /// - Parameter Error:Description of any error that might  occur
    func getDetail(id: String, completion:@escaping((Detail, Error?) -> Void)) {
        let detailRepository =  DetailRepository()
        detailRepository.getDetail(id) { result, error in
            if error != nil {
                completion(Detail(), error)
            } else {
                let detail: Detail = result
                completion(detail, nil)
            }
        }
    }
}
