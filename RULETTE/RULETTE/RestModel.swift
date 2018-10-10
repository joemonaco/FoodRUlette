//
//  RestModel.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/6/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import Foundation
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
    init() {
        resturants = []
        api = ""
    }
    
    func setApi(withURL url: String) {
        api = url
        
    }
    
    func resetApi(){
            api = ""
    }
    
    
    
    func addToArray(addRestaurant rest: restaurants) {
        //print(rest.name + " " + String(rest.lat) + " " + String(rest.long))
        print(rest)
        resturants.append(rest)
    }
    
}
