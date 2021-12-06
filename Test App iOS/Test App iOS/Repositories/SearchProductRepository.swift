//
//  SearchProductRepository.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation
import Alamofire


// MARK: - Class to implement search products respository - call service
class SearchProductRepository {
    
    // MARK: - Function to get the details of a product by calling the service.
    /// - parameter siteId: A string to use identity of the site
    /// - parameter product: A string to use identify of the product
    /// - parameter completion: The completion handler with  list of  ProductItem  data and optional error
    /// - Parameter Error:Description of any error that might  occur
    func getProductList(_ siteId: String, _ product: String, completion: @escaping (_ result: [ProductItem], _ error: Error?) -> Void) {
        let url = "\(Service.baseUrl)\(Service.siteEndPoint)/\(siteId)\(Service.searchEndPoint)\(product)"
        AF.request(url, method: .get).validate(statusCode: Service.statusCodeOk)
            .responseDecodable (of: Product.self) { response in
                if let result = response.value {
                    let productList: [ProductItem] = result.results ?? [ProductItem]()
                    completion(productList, nil)
                }
                
                if let error = response.error {
                    print("\(Constant.errorSearchProduct) \(error)")
                    completion([ProductItem()] , error)
                }
            }
    }
}
