//
//  ViewController.swift
//  Final Programming 2 Project
//
//  Created by Marlayna Verenna on 5/3/20.
//  Copyright © 2020 Marlayna Verenna. All rights reserved.
//

import UIKit
import CoreLocation
import WebKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    // Ice Cream Coordinates
    let iceCreamLatitude: CLLocationDegrees = 40.3085
    let iceCreamLongitude: CLLocationDegrees = -79.5831
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Somthing is happening")
        
        // horizontal accuracy less than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            let iceCream:CLLocation = CLLocation(latitude: iceCreamLatitude, longitude: iceCreamLongitude)
            
            let delta:CLLocationDistance = iceCream.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5
              // meters to rounded miles
            
            if miles < 3 {
                // Stop updating the location
                locMan.stopUpdatingLocation()
                // Congratulate the user
                distanceLabel.text = "Get your ice cream here!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
              distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))! + " miles"
            }
            
            
        }
        else {
            // add action if error with GPS
        }
       
    }
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func openSite(_ sender: Any) {
        if let url = URL(string: "https://www.coldstonecreamery.com/stores/22267") {
                   UIApplication.shared.open(url, options: [:])
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locMan.delegate = self
               locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
               locMan.distanceFilter = 1609; // a mile (in meters)
               locMan.requestWhenInUseAuthorization() // verify access to gps
               locMan.startUpdatingLocation()
               startLocation = nil
        
        // Load Website
             let myURL = URL(string:"https://www.coldstonecreamery.com/stores/22267")
             let myRequest = URLRequest(url: myURL!)
             webView.load(myRequest)
        
        
    }


}

