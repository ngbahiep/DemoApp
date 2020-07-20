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
    @IBOutlet weak var btnAddActivity: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    
    let locationManager = CLLocationManager()
    var location: CLLocation! = nil
    var address: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make navigation bar transparent
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        btnAddActivity.layer.cornerRadius = 30
        btnHistory.layer.cornerRadius = 30
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
    }
    

    @IBAction func touchedOnAddActivity(sender: UIButton) {
        if let addActivityVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddActivityViewController") as? AddActivityViewController {
            addActivityVC.location = self.location
            addActivityVC.address = self.address
            self.navigationController?.pushViewController(addActivityVC, animated: true)
        }
    }
    
    @IBAction func touchedOnHistory(sender: UIButton) {
        if let historyVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HistoryViewController") as? HistoryViewController {
            self.navigationController?.pushViewController(historyVC, animated: true)
        }
    }
    
    func parseLocationToAddress(location: CLLocation) {
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { (placeMarks, error) in
            if let placeMark = placeMarks?.first {
                debugPrint("placeMark: \(placeMark)")
                if self.address.isEmpty {
                    self.address.append(contentsOf: placeMark.locality ?? "")
                    self.address.append(contentsOf: ", ")
                    self.address.append(contentsOf: placeMark.postalCode ?? "")
                    self.address.append(contentsOf: ", ")
                    self.address.append(contentsOf: placeMark.country ?? "")
                    
                    print("Address: \(self.address)")
                }
            }
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

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations \(locations)")
        if locations.count > 0 {
            location = locations.first
            locationManager.stopUpdatingLocation()
            mapView.centerToLocation(location: location)
            self.parseLocationToAddress(location: location)
        }
    }
}
