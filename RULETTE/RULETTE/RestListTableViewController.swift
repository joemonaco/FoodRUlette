//
//  RestListTableViewController.swift
//  RULETTE
//
//  Created by Joe Monaco on 10/6/18.
//  Copyright © 2018 Joe Monaco. All rights reserved.
//

import UIKit
//import Alamofire
//import SwiftyJSON

class RestListTableViewController: UITableViewController {

    
    let restModel = RestModel.restaurantModel
    var rests: [restaurants] = []
    var randomIndex = false
    var apiUrl: String?
    
    @IBOutlet weak var rutgersLogoImage: UIImageView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        activityView.isHidden = false
        tableView.backgroundView = activityView
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
 
        addRests()
    }

    func addRests() {
        
        let apiURLstring = restModel.api
        let apiURL = URL(string: apiURLstring)!
        
        var request = URLRequest(url: apiURL)
        request.setValue("bf15826772d3e84e", forHTTPHeaderField: "X-Access-Token")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
           DispatchQueue.main.async {
                guard let data = data else {return}
                
                do {
                    let jsondata = try JSONDecoder().decode(Initial.self, from: data)
                   
                    for item in jsondata.restaurants {
                        self.rests.append(restaurants(name: item.name, logoUrl: item.logoUrl, url: item.url, streetAddress: item.streetAddress, city: item.city, state: item.state, zip: item.zip))
                    }
                    
                    self.activityView.stopAnimating()
                    self.activityView.isHidden = true
                    
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
 
                    
                    
                    //this loop is to update the model
                    for r in self.rests {
                        self.restModel.addToArray(addRestaurant: r)
                    }
                    
                } catch let jsonErr {
                    print("error", jsonErr)
                }
            }
        }.resume()
    }

    
   /* override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }*/
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTVCell
        
        let url = URL(string: rests[indexPath.row].logoUrl)
        let data = try? Data(contentsOf: url!)
        
        if let imageData = data {
            let image = UIImage(data: imageData)
            cell.setImage(withImage: image!)
        }
        
        cell.setNameLabel(withName: rests[indexPath.row].name)
        
        // Configure the cell...

        return cell
    }
    
    @IBAction func difCampus(_ sender: Any) {
        restModel.resetApi()
       self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pickRandomRestaurants(_ sender: Any) {
        randomIndex = true
        performSegue(withIdentifier: "showRestDetails", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showRestDetails", sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let restDetailView = segue.destination as! RestDetailViewController
        
        if !randomIndex {
            if let selectedPath = tableView.indexPathForSelectedRow {
                let selectedIndex = selectedPath.row
                restDetailView.selectedRestIndex = selectedIndex
            }
        }
        else {
            let selectedIndex = Int.random(in: 0..<rests.count)
            restDetailView.selectedRestIndex = selectedIndex
        }
    }
 

}
