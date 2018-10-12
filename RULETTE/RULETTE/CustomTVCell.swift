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
    
    
    let restModel = RestModel.restaurantModel
    let effects = Effects.effectModel
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setBackground(atIndex row: Int) {
        
        let bgImgView = effects.blur(forRow: row, withBounds: self.bounds)
        self.backgroundView = bgImgView
        self.backgroundColor = UIColor.clear
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
