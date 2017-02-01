//
//  RoutePlanerAlternativeDetailsTableViewCell.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class RoutePlanerAlternativeDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet var stationMachine: UIImageView!
    
    
    @IBOutlet var sourceTime: UILabel!
    @IBOutlet var sourceLocation: UILabel!
    
    @IBOutlet var station: UILabel!
    
    @IBOutlet var destinationTime: UILabel!
    @IBOutlet var destinationLocation: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
