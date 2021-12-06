//
//  Site.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation

// MARK: - Deserialize sites response
struct Site: Codable {
    var id: String?
    var name: String?
}

typealias Sites = [Site]
