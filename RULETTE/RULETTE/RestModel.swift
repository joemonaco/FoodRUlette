//
//  RestModel.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/6/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import Foundation
import UIKit
//@testable import Alamofire
//@testable import SwiftyJSON


struct Initial: Decodable {
    let restaurants: [restaurants]
}

struct restaurants: Decodable {
    var name: String//Name of Restuarant
    var logoUrl: String
    var url: String
    var streetAddress: String
    var city: String
    var state: String
    var zip: String
    
    
    func getAddress() -> String {
        return streetAddress + " " + city + ", " + state + ", " + zip
    }
    
}

class RestModel {
    
    static let restaurantModel = RestModel()
    var resturants: [restaurants]
    var api: String
    var restCount = 0
    var campus: String
    
    var school: String
    
    init() {
        resturants = []
        api = ""
        school = ""
        campus = ""
    }
    
    func setSchool(withSchool s: String) {
        school = s
    }
    
    func setCampus(withName c: String) {
        campus = c
    }
    
    func setApi(withURL url: String) {
        api = url
        
    }
    
    func resetApi(){
            api = ""
    }
    
    func getLogoImage(forRow r: Int) -> UIImage? {
        
        
        let url = URL(string: resturants[r].logoUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            return UIImage(data: imageData)
        }
        return nil
        
    }
    
    
    
    func addToArray(addRestaurant rest: restaurants) {
        resturants.append(rest)
    }
    
}
