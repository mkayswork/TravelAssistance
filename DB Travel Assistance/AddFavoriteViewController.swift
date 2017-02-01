//
//  AddFavoriteViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit
protocol FavoriteRideAddedDelegate {
    func addedNewFavorite()
}

class AddFavoriteViewController: UIViewController {
    
    @IBOutlet var sourceValue: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    

    var delegate: FavoriteRideAddedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func segmentedControlTapped(_ sender: UISegmentedControl) {
    }
}

extension AddFavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        cell.textLabel?.font = UIFont(name: "DB Sans Comp", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
