//
//  GameInfo.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit

public class GameInfo {
    
    var name: String
    var desc: String
    var image: UIImage
    
    init() {
        self.name = String()
        self.desc = String()
        self.image = UIImage()
    }
    
    init(name: String, desc: String, image: UIImage) {
        self.name = name
        self.desc = desc
        self.image = image
    }
}
