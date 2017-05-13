//
//  JsonParcer.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public class JsonParcer {
    
    func parceFromFile(forParce: inout Array<GameInfo>, fileName: String) {
        let filePath = Bundle.main.path(forResource: fileName, ofType: "json")
        do {
            let fileData = try! String(contentsOfFile: filePath!, encoding: String.Encoding.utf8)
            let data = fileData.data(using: .utf8)!
            let parsedData = try? JSONSerialization.jsonObject(with: data, options: []) as! NSArray
            for game in parsedData!{
                let arr = game as? NSDictionary
                forParce.append(
                    GameInfo(
                        name: arr!["name"] as! String,
                        desc: (arr?["desc"])! as! String,
                        image: UIImage(named: (arr?["image"])! as! String)!
                    )
                )
            }
        }
    }
}
