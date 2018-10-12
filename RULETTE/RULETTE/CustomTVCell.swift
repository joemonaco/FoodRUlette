//
//  CustomTVCell.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/7/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import UIKit

class CustomTVCell: UITableViewCell {

    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(withImage img: UIImage) {
        logoImage.image = img
        logoImage.layer.cornerRadius = logoImage.frame.size.width / 2
        logoImage.clipsToBounds = true
    }
    
    func setNameLabel(withName name: String) {
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.1
        nameLabel.text = name
    }

}
