//
//  MyTravelStatusListViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 05.01.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class MyTravelStatusListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var noMessagesList = [""]
    //var messages = []
    
    // Meldungen der jetzigen Fahrt anzapfen
    var selectedRow: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func configureData(){
    }
    
    func configureView(){
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toStatusDetail") {
            let destinationController = segue.destination as! MyTravelStatusDetailsViewController
            // destinationViewController.DS = DSListe[selectedRow]
            //
        }
    }
    
    @IBAction func legendButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func travelAssitanceButtonTapped(_ sender: UIBarButtonItem) {
    }
    
}

extension MyTravelStatusListViewController: UITableViewDelegate, UITableViewDataSource, MyTravelStatusCellDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTravelStatusTableViewCell
        
        cell.row = indexPath.row
        cell.delegate = self
        // cockmagic
        // --> Fill cell with informatiom
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func didTapInfoButton(row: Int) {
        // go to details of status
        selectedRow = row
        performSegue(withIdentifier: "toStatusDetail", sender: self)
    }
    
}
