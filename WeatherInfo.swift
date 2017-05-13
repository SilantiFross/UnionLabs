//
//  WeatherInfo.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

public class WeatherInfo {
    
    var name: String
    var temp: Int
    var humidity: Float
    var description: String
    var latitude: Float
    var longitude: Float
    
    init() {
        self.name = String()
        self.temp = Int()
        self.humidity = Float()
        self.description = String()
        self.latitude = Float()
        self.longitude = Float()
    }
    
    init(nameCity: String, temp: Int, humidity: Float, description: String, latitude: Float, longitude: Float) {
        self.name = nameCity
        self.temp = temp
        self.humidity = humidity
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }
}
