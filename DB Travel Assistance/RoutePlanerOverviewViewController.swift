//
//  RoutePlanerOverviewViewController.swift
//  DB Travel Assistance
//
//  Created by Matthias Kühnel on 01.02.17.
//  Copyright © 2017 Mkayswork. All rights reserved.
//

import UIKit
import MapKit

class RoutePlanerOverviewViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    @IBOutlet var everythinOkayLabel: UILabel!
    
    @IBOutlet var buttonContainer: UIView!
    
    
    
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
    
    
// MARK: button actions
    
    @IBAction func showAlternativeRouteButtonTapped(_ sender: UIButton) {
        switch sender.tag{
            // fastest
            case 0:
                print("")
            
            // cheapest
            case 1:
                print("")
            
            // minimum changes
            case 2:
                print("")
            default: break
        }
    }

}

extension RoutePlanerOverviewViewController: MKMapViewDelegate {
    
}
