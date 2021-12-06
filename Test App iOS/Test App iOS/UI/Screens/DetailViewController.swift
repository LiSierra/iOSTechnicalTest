//
//  DetailViewController.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 3/12/21.
//

import Foundation
import UIKit

// MARK: - Class for implement view detail product
class DetailViewController: BaseViewController {
    
    var product: ProductItem?
    var detailViewModel: DetailViewModel?
    
    @IBOutlet weak var ivDetail: UIImageView!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var lbPriceTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loadingView(true)
        setup()
       
    }
    
    // MARK: - Function for setup the view
    private func setup() {
        detailViewModel?.getDetail(id: product?.id ?? Constant.empty) { detail, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.loadingView(false)
            }
            if error != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    self.showSimpleAlert()
                }
            } else {
                self.ivDetail.downloaded(from: self.product?.thumbnail ?? Constant.empty)
                self.lbPriceTitle.text = Constant.precio
                self.lbPrice.text = Utility.convertDoubleToCurrency(self.product?.price ?? 0)
                self.lbTitle.text = self.product?.title
                self.lbDescription.text = detail.plain_text
            }
        }
    }
}
