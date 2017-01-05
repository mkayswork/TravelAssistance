//
//  MyTravelStatusTableViewCell.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.01.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

protocol MyTravelStatusCellDelegate {
    func didTapInfoButton(row: Int)
}

class MyTravelStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var statusTime: UILabel!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var statusCategory: UILabel!
    @IBOutlet weak var statusNotice: UILabel!
    @IBOutlet weak var statusMessage: UILabel!
    
    
    var row: Int!
    var delegate: MyTravelStatusCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func didTapInfoButton(_ sender: Any) {
        didTapInfoButton(row)
    }
}
