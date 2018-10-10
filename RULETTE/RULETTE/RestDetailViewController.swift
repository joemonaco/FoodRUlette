//
//  RestDetailViewController.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/6/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import UIKit
import MapKit
//import Alamofire
//import SwiftyJSON

class RestDetailViewController: UIViewController {
    
    var selectedRestIndex:Int?
    @IBOutlet weak var restNameLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var linkButton: UIButton!
    
    let restModel = RestModel.restaurantModel
    var selectedRest: restaurants?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let index = selectedRestIndex {
            selectedRest = restModel.resturants[index]
        }
        
        let buttonImage = getButtonImage()!
        
        linkButton.setImage(buttonImage, for: .normal)
        
        restNameLabel.text = selectedRest!.name
        
        
        
        let geocoder = CLGeocoder()
        let address = selectedRest!.getAddress()
        
        
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error ?? "")
            }
            if let placemark = placemarks?.first {
                let coordinates:CLLocationCoordinate2D = placemark.location!.coordinate
                self.centerMapOnLocation(location: CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude))
                self.addLocation(location: coordinates, name: self.selectedRest!.name)
            }
        })
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func getButtonImage() -> UIImage? {
        let url = URL(string: selectedRest!.logoUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            return image!
        }
        
        return nil
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius:CLLocationDistance = 100
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
        
    }
    
    func addLocation (location loc: CLLocationCoordinate2D, name title: String) {
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = loc
        annotation.title = title
        map.addAnnotation(annotation)
    }
    

    @IBAction func eatStLink(_ sender: Any) {
        
        guard let url = URL(string: selectedRest!.url) else {
            return //be safe
        }
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
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
