//
//  SecondTableViewCell.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    static let id = "SecondTableViewCell"
    @IBOutlet weak var storageImage: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "SecondTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showImage(image: UIImage){
        self.storageImage.image = image
    }
    
}
