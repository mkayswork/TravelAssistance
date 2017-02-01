//
//  MyTravelChooseTrainRideTableViewCell.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class MyTravelChooseTrainRideTableViewCell: UITableViewCell {

    @IBOutlet weak var sourceLocation: UILabel!
    
    @IBOutlet weak var destinationLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
