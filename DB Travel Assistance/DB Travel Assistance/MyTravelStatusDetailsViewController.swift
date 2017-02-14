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
    @IBOutlet weak var messageText: UITextView!
    
    
    var statusNotification: StatusNotification!
    
    override func viewWillAppear(_ animated: Bool) {
        categoryImage.image = UIImage(named: statusNotification.category.rawValue)
        categoryLabel.text = statusNotification.category.rawValue
        statusCreationLabel.text = "Erstellt um: " + statusNotification.time
        messageText.text = statusNotification.messageText
        messageLabel.text = statusNotification.messageTitle
    }
    
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

    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
    
    
