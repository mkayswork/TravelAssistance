//
//  RoutePlanerAlternativeTableViewCell.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit
protocol RoutePlanerAlternativeCellDelegate {
    func cellSelected(row: Int)
}

class RoutePlanerAlternativeTableViewCell: UITableViewCell {

    @IBOutlet var timeFromSourceDestination: UILabel!
    
    @IBOutlet var firstImage: UIImageView!
    
    @IBOutlet var secondImage: UIImageView!
    
    @IBOutlet var thirdImage: UIImageView!
    
    @IBOutlet var fourthImage: UIImageView!
    
    @IBOutlet var fifthImage: UIImageView!
    @IBOutlet var sixthImage: UIImageView!
    
    var row: Int?
    var delegate: RoutePlanerAlternativeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func showDetailsTapped(_ sender: Any) {
        self.delegate?.cellSelected(row: self.row!)
    }
    
}
