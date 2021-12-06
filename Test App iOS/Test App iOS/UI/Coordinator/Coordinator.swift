//
//  Coordinator.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import Foundation
import UIKit

// MARK: - Protocol for init setting navigation
protocol Coordinator {
    var navigationController : UINavigationController {set get}
    func start()
}
