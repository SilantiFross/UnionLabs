//
//  MapViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import GoogleMaps
import Alamofire

class MapViewController: UIViewController, GMSMapViewDelegate {

    let marker = GMSMarker()
    var city = WeatherInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.camera(withLatitude: 53.8, longitude: 27.5, zoom: 7)
        
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        view = mapView
        
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=\(marker.position.latitude)&lon=\(marker.position.longitude)&units=metric&appid=2cd1bf75b92f8d390ccb309039f8aa68"
        parceFromUrl(url: url)
    }
    
    func parceFromUrl(url: String) {
        Alamofire.request(url).responseJSON{ response in
            if (response.result.value != nil) {
                let json = response.result.value as! NSDictionary
                
                let name = json["name"] as! String
                let main = json["main"] as! NSDictionary
                let weatherArr = json["weather"] as! NSArray
                let weather = weatherArr[0] as! NSDictionary
                let coord = json["coord"] as! NSDictionary
                
                let temp = main["temp"] as! Int
                let humidity = main["humidity"] as! Float
                let description = weather["description"] as! String
                let latitude = coord["lat"] as! Float
                let longitude = coord["lon"] as! Float
                
                self.city.name = name
                self.city.temp = temp
                self.city.humidity = humidity
                self.city.description = description
                self.city.latitude = latitude
                self.city.longitude = longitude
                
                
                self.marker.title = self.city.name
                self.marker.snippet = "Temp: " + String(self.city.temp) + " °C\nHumidity: " + String(self.city.humidity) + "%\nDescription: " + String(self.city.description)
            }
        }
    }
}
