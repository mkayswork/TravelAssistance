//
//  RoutePlanerAlternativeDetailsViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit

class RoutePlanerAlternativeDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
        
    }
}
extension RoutePlanerAlternativeDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell") as! RoutePlanerAlternativeDetailsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
