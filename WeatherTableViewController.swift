//
//  WeatherTableViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import Alamofire

class WeatherTableViewController: UITableViewController {

    @IBOutlet var TableViewWeather: UITableView!
    
    var infoWeather = [WeatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parceFromUrl(url: "http://api.openweathermap.org/data/2.5/box/city?bbox=23,51,31,55,10&appid=2cd1bf75b92f8d390ccb309039f8aa68")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoWeather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.TableViewWeather.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        cell.LabelCity.text = infoWeather[indexPath.row].name
        cell.LabelTemp.text = String(infoWeather[indexPath.row].temp) + " °C"
        cell.LabelDesc.text = infoWeather[indexPath.row].description
        cell.LabelHumitidy.text = String(infoWeather[indexPath.row].humidity)
        cell.LabelLatitude.text = String(infoWeather[indexPath.row].latitude)
        cell.LabelLongitude.text = String(infoWeather[indexPath.row].longitude)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController: MapCityViewController = segue.destination as! MapCityViewController
        
        let cell = sender as! WeatherTableViewCell
        
        viewController.name = cell.LabelCity.text!
        viewController.temp = cell.LabelTemp.text!
        viewController.desc = cell.LabelDesc.text!
        viewController.humidity = cell.LabelHumitidy.text!
        viewController.latitude = Double(cell.LabelLatitude.text!)!
        viewController.longitude = Double(cell.LabelLongitude.text!)!
    }
    
    func parceFromUrl(url: String) {
        Alamofire.request(url).responseJSON{ response in
            if (response.result.value != nil) {
                let json = response.result.value as! NSDictionary
                let listCities = json["list"] as! NSArray
                
                for city in listCities {
                    let res = city as! NSDictionary
                    let main = res["main"] as! NSDictionary
                    let coord = res["coord"] as! NSDictionary
                    let weatherArr = res["weather"] as! NSArray
                    let weather = weatherArr[0] as! NSDictionary
                    
                    let temp = main["temp"] as! Int
                    let humidity = main["humidity"] as! Float
                    let description = weather["description"] as! String
                    let latitude = coord["Lat"] as! Float
                    let longitude = coord["Lon"] as! Float
                    
                    self.infoWeather.append(
                        WeatherInfo(
                            nameCity: res["name"] as! String,
                            temp: temp,
                            humidity: humidity,
                            description: description,
                            latitude: latitude,
                            longitude: longitude
                        )
                    )
                }
                self.TableViewWeather.reloadData()
            }
        }
    }
}
