//
//  ProductCell.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 1/12/21.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    /// - returns: cell Identifier
    class var cellIdentifier: String {
        String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Function for setup the cell
    func configure(_ product: ProductItem) {
        ivProduct.downloaded(from: product.thumbnail ?? Constant.empty)
        lbTitle.text = product.title
        lbPrice.text = Utility.convertDoubleToCurrency(product.price ?? 0)
    }
}
