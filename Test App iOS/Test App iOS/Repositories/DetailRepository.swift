//
//  DetailRepository.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation
import Alamofire

// MARK: - Class to implement detail of produt respository - call service
class DetailRepository {
    
    // MARK: - Function to get the details of a product by calling the service.
    /// - parameter id: A string to use identity of the product
    /// - parameter completion: The completion handler with Detail data and optional error
    /// - Parameter Error:Description of any error that might  occur
    func getDetail(_ id: String, completion: @escaping (_ result: Detail, _ error: Error?) -> Void) {
        let url = "\(Service.baseUrl)\(Service.itemsDetail)/\(id)\(Service.productDetail)"
        AF.request(url, method: .get).validate(statusCode: Service.statusCodeOk)
            .responseDecodable (of: Detail.self) { response in
                if let result = response.value {
                    let detail: Detail = result
                    completion(detail, nil)
                }
                
                if let error = response.error {
                    print("\(Constant.errorDetail) \(error)")
                    completion(Detail() , error)
                }
            }
    }
}
