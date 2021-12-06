//
//  FirstTableViewCell.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    
    static let id = "FirstTableViewCell"
    @IBOutlet weak var nameTextField: UITextField!
    
    static func nib() -> UINib {
        return UINib(nibName: "FirstTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.nameTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
 
extension FirstTableViewCell: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacter = CharacterSet.letters
        let allowedCharacter1 = CharacterSet.whitespaces
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacter.isSuperset(of: characterSet) || allowedCharacter1.isSuperset(of: characterSet)
        
    }
}
