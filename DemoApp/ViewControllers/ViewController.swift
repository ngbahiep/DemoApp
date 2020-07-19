//
//  ViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 18/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase
import SkyFloatingLabelTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    let locationManager = CLLocationManager()
    var latitue: CLLocationDegrees = 0.0
    var longtitude: CLLocationDegrees = 0.0
    var location: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locationManager.startUpdatingLocation()
        }
        
        btnLogin.layer.cornerRadius = 30
        btnSignup.layer.cornerRadius = 30
    }


//    @IBAction func touchedOnLogin(sender: UIButton) {
////        if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
////            homeVC.location = location
////            let navigator = UINavigationController(rootViewController: homeVC)
////            self.present(navigator, animated: true, completion: nil)
////        }
//        
//        let phoneNumber = "+60136333741"
//
//        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
//            if let error = error {
//              print(error)
//              return
//            }
//
//            print("verificationID \(verificationID)")
//            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
//        }
//        
//    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations \(locations)")
        if locations.count > 0 {
            location = locations.first
            locationManager.stopUpdatingLocation()
        }
    }
}
