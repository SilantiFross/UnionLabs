//
//  WeatherTableViewCell.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var LabelCity: UILabel!
    @IBOutlet weak var LabelTemp: UILabel!
    @IBOutlet weak var LabelDesc: UILabel!
    @IBOutlet weak var LabelHumitidy: UILabel!
    @IBOutlet weak var LabelLongitude: UILabel!
    @IBOutlet weak var LabelLatitude: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
