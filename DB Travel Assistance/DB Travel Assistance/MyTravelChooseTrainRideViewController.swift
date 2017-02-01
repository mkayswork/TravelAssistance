//
//  MyTravelChooseTrainRideViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

protocol MyTravelChooseTrainRideDelegate {
    func trainRideSelected()
}

class MyTravelChooseTrainRideViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fahrt verfolgen:"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}

extension MyTravelChooseTrainRideViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyTravelChooseTrainRideTableViewCell
        
        //cell.sourceLocation.text = ""
        //cell.destinationLocation.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
