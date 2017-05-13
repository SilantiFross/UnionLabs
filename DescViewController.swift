//
//  DescViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {

    @IBOutlet weak var LabelName: UILabel!
    @IBOutlet weak var ImageGame: UIImageView!
    @IBOutlet weak var TextFieldDesc: UITextView!
    
    var gameInfo = GameInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LabelName.text = gameInfo.name
        ImageGame.image = gameInfo.image
        TextFieldDesc.text = gameInfo.desc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
