//
//  SitiesRepository.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation
import Alamofire


// MARK: - Class to implement sites respository - call service
class SitesRepository {
    
    // MARK: - Function to get the a sites list by calling the service.
    /// - parameter completion: The completion handler with  list of Sites data and optional error
    /// - Parameter Error:Description of any error that might  occur
    func getSiteList(completion: @escaping (_ result: [Site], _ error: Error?) -> Void) {
        let url = "\(Service.baseUrl)\(Service.siteEndPoint)"
        AF.request(url, method: .get).validate(statusCode: Service.statusCodeOk)
            .responseDecodable (of: Sites.self) { response in
                if let result = response.value {
                    let siteList: [Site] = result
                    completion(siteList, nil)
                }
                 
                if let error = response.error {
                    print("\(Constant.errorSites) \(error)")
                    completion([Site()] , error)
                }
        }
    }
}
