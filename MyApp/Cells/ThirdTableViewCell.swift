//
//  ThirdTableViewCell.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import UIKit

class ThirdTableViewCell: UITableViewCell {
    
    static let id = "ThirdTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ThirdTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
