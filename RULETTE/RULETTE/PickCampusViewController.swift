//
//  PickCampusViewController.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/7/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import UIKit

class PickCampusViewController: UIViewController {

    var api: String = ""
    
    let restModel = RestModel.restaurantModel
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func campusPicked(_ sender: UIButton) {
        
        let campus = sender.titleLabel!.text!
        
        switch campus {
        case "College Ave":
            api = "https://api.eatstreet.com/publicapi/v1/restaurant/search?method=both&street-address=58+Huntington+St.+New+Brunswick,+NJ,+08901"
            restModel.setApi(withURL: api)
            performSegue(withIdentifier: "campusPickSegue", sender: self)
            break
        case "Busch":
            api = "https://api.eatstreet.com/publicapi/v1/restaurant/search?method=both&street-address=604+Bartholomew+Rd,+Piscataway+Township,+NJ+08854"
            restModel.setApi(withURL: api)
            performSegue(withIdentifier: "campusPickSegue", sender: self)
            break
        case "Livingston":
            api = "https://api.eatstreet.com/publicapi/v1/restaurant/search?method=both&street-address=84+Joyce+Kilmer+Ave+%23117D,+Piscataway+Township,+NJ+08854"
            restModel.setApi(withURL: api)
            performSegue(withIdentifier: "campusPickSegue", sender: self)
            break
        default:
            api = "https://api.eatstreet.com/publicapi/v1/restaurant/search?method=both&street-address=100+George+St,+New+Brunswick,+NJ+08901"
            restModel.setApi(withURL: api)
            performSegue(withIdentifier: "campusPickSegue", sender: self)
            break
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }*/
    

}
