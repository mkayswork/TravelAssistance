//
//  MyTravelStatusDetailsViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.01.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class MyTravelStatusDetailsViewController: UIViewController {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusCreationLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageText: UIScrollView!
    
    var statusMeldung: AnyObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func configureData(){
        // Statusmeldungen auffüllen
        // Irgendwas anzapfen
    }

    func configureView(){
        self.navigationItem.titleFont = Constants.titleFont()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
