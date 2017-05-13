//
//  MapCityViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import GoogleMaps

class MapCityViewController: UIViewController {

    @IBOutlet weak var ViewMapCity: GMSMapView!
    
    let marker = GMSMarker()
    
    var name: String = ""
    var temp: String = ""
    var humidity: String = ""
    var desc: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 6.0)
        
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = name
        marker.snippet = "Temp: " + temp + " °C\nHumidity: " + humidity + "%\nDescription: " + desc
        marker.map = self.ViewMapCity
        
        self.ViewMapCity.camera = camera
        self.ViewMapCity.isMyLocationEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
