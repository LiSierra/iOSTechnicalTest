//
//  Utility.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation
import UIKit

class Utility {
    // MARK: - Function of register for table view
    static func registerCells(tableView: UITableView, isSite: Bool) {
        if isSite {
            tableView.register(UINib(nibName: SiteCell.cellIdentifier, bundle: nil),
                               forCellReuseIdentifier: SiteCell.cellIdentifier)
        } else {
            tableView.register(UINib(nibName: ProductCell.cellIdentifier, bundle: nil),
                               forCellReuseIdentifier: ProductCell.cellIdentifier)
        }
    }
    
    // MARK: - Function of register for cell view sites
    static func getSiteCell(to indexPath: IndexPath, tableView: UITableView) -> SiteCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SiteCell.cellIdentifier,
                                                    for: indexPath) as? SiteCell {
            return cell
        }
        return SiteCell()
    }
    
    // MARK: - Function of register for cell view product
    static func getProductCell(to indexPath: IndexPath, tableView: UITableView) -> ProductCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.cellIdentifier,
                                                    for: indexPath) as? ProductCell {
            return cell
        }
        return ProductCell()
    }
    
    // MARK: - Function of convert price from double to string
    static func convertDoubleToCurrency(_ price: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = ","
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.generatesDecimalNumbers = true
        return "$\(numberFormatter.string(from: price as NSNumber)!)"
    }
}
