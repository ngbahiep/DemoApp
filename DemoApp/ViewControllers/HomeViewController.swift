//
//  HomeViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 18/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var location: CLLocation! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint(location)

        mapView.centerToLocation(location: location)
    }
    

    @IBAction func touchedOnAddActivity(sender: UIButton) {
        if let addActivityVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddActivityViewController") as? AddActivityViewController {
            self.navigationController?.pushViewController(addActivityVC, animated: true)
        }
    }

}

private extension MKMapView {
    func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 2000) {
        let cordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        setRegion(cordinateRegion, animated: true)
    }
}
