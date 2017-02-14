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
    var statusNotifications = [StatusNotification]()
    
    // Meldungen der jetzigen Fahrt anzapfen
    var selectedRow: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if tableView.indexPathForSelectedRow?.row != nil {
            self.tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func configureData(){
        // configureTestMessages

        
        let cell1 = StatusNotification(time: "10:12", category: .Ausfall, messageTitle: "Zugnummer XYZ fällt aus", messageText: "Der Zug XYZ fällt aufgrund von vereisten Gleisen leider aus.")
        let cell2 = StatusNotification(time: "10:30", category: .Freitext, messageTitle: "Bordbistro geschlossen", messageText: "Aufgrund von einem Küchendefekt ist das Bordbistro bis auf Weiteres geschlossen")
        let cell3 = StatusNotification(time: "10:45", category: .Umleitung, messageTitle: "Umleitung", messageText: "Aufgrund einer Streckensperrung zwischen Offenbach(Hbf) und Frankfurt(Süd) muss über die Haltestelle X gefahren werden")
        statusNotifications.append(cell1)
        statusNotifications.append(cell2)
        statusNotifications.append(cell3)
    }
    
    func configureView(){
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toStatusDetail") {
            let destinationController = segue.destination as! MyTravelStatusDetailsViewController
            destinationController.statusNotification = statusNotifications[selectedRow!]
            // destinationViewController.DS = DSListe[selectedRow]
            //
        }
    }
    
    @IBAction func legendButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func travelAssitanceButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func testNotificationTapped(_ sender: UIBarButtonItem) {
        PushNotificator.sharedInstance.pushNotificationWithCategoryAndMessageAndDelay(category: "Ausfall", message: "Der Zug von A nach B fällt aus")
    }
}

extension MyTravelStatusListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationCell") as! MyTravelStatusTableViewCell
        
        let statusNotification = self.statusNotifications[indexPath.row]
        
        cell.statusTime.text = statusNotification.time
        cell.statusCategory.text = statusNotification.category.rawValue
        cell.statusNotice.text = statusNotification.messageTitle
        cell.statusMessage.text = statusNotification.messageText
        
        cell.statusImage.image = UIImage(named: statusNotification.category.rawValue)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.statusNotifications.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "toStatusDetail", sender: self)
    }
    
}
