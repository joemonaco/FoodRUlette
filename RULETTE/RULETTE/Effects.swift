//
//  Effects.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/12/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import Foundation
import UIKit

class Effects {
    
    static let effectModel = Effects()
    let restModel = RestModel.restaurantModel

    func blur(forRow row: Int, withBounds bounds: CGRect) -> UIView {
        
        let bgImgView = UIImageView(frame: bounds)
        
        
        let bgImg = restModel.getLogoImage(forRow: row)
        
        //let bgImg = UIImage(named: "red.png")
        bgImgView.image = bgImg
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = bgImgView.bounds
        bgImgView.addSubview(blurView)
        
        return bgImgView
        
    }
    
}
