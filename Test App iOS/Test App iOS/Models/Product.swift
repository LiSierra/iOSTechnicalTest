//
//  Product.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation

// MARK: - Deserialize Products response
struct Product: Codable {
    var results: [ProductItem]?
}

// MARK: - Desrialize Results Array
struct ProductItem: Codable {
    var id: String?
    var title: String?
    var price: Double?
    var thumbnail: String?
}
