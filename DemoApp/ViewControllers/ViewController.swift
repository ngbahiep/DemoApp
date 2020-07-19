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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Make navigation bar transparent
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
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
