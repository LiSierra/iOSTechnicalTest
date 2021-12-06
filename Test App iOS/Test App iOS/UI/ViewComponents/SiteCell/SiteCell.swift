//
//  SiteCell.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import UIKit

class SiteCell: UITableViewCell {

    @IBOutlet weak var lbSite: UILabel!
    
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
    func configure(_ site: Site) {
        lbSite.text = site.name
    }
    
}
