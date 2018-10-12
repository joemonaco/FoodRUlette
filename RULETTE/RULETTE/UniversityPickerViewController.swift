//
//  UniversityPickerViewController.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/10/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import UIKit

class UniversityPickerViewController: UIViewController {

    let restModel = RestModel.restaurantModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func monmouthPicked(_ sender: Any) {
        
        let api = "https://api.eatstreet.com/publicapi/v1/restaurant/search?method=both&pickup-radius=10&street-address=400+Cedar+Ave.+West+Long+Branch"
        
        restModel.setApi(withURL: api)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
