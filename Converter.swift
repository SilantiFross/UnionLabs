//
//  Converter.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation

class Converter {
    let milesInKm: Double = 0.621
    let nauticalMilesInKm: Double = 0.534
    let yardsInKm: Double = 1093.6
    
    func convertKm(km: Double, unit: Double) -> Double {
        return km * unit
    }
}
