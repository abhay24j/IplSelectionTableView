//
//  IplTableViewCell.swift
//  iplDetails
//
//  Created by Abhay Kumar on 22/04/22.
//

import UIKit
protocol Action:AnyObject {
    func handelAction(indexPath:IndexPath)
}
class IplTableViewCell: UITableViewCell {

    @IBOutlet weak var iplLbl: UILabel!
    var indexPath :IndexPath!
    weak var delegate:Action?
    @IBOutlet weak var plyrButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func plyrButton(_ sender: UIButton) {
        delegate?.handelAction(indexPath: indexPath)
       }
  
    func updateCell(isMark: Bool, name : String) {
        self.iplLbl.text = name
        if(isMark) {
            updateButtonImage(button: plyrButton, imageName: "check")
        }
        else {
            updateButtonImage(button: plyrButton, imageName: "uncheck")
        }
    }
    
    func updateButtonImage(button : UIButton, imageName : String) {
        button.setImage(UIImage(named: imageName), for: .disabled)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.setImage(UIImage(named: imageName), for: .selected)
        button.setImage(UIImage(named: imageName), for: .highlighted)
    }

}
