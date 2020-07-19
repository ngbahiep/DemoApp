//
//  PhoneLoginViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 19/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class PhoneLoginViewController: UIViewController {

    @IBOutlet weak var vTxtPhone: UIView!
    @IBOutlet weak var btnCommit: UIButton!
    
    var txtPhone: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtPhone = SkyFloatingLabelTextField(frame: vTxtPhone.frame)
        txtPhone.placeholder = "123456789"
        txtPhone.title = "Mobile Number"
        txtPhone.textContentType = .telephoneNumber
        txtPhone.keyboardType = .phonePad
        self.view.addSubview(txtPhone)
        
        btnCommit.layer.cornerRadius = 30
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtPhone.becomeFirstResponder()
    }
    
    @IBAction func touchedOnSubmit(sender: UIButton) {
        
        let phoneNumber = txtPhone.text ?? ""
        
        if phoneNumber.count < 9 {
            txtPhone.errorMessage = "Invalid Phone Number"
            return
        }
        
        txtPhone.errorMessage = ""
        
        if let verificationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VerificationCodeViewController") as? VerificationCodeViewController {
            verificationVC.phoneNumber = "+60" + phoneNumber
            self.navigationController?.pushViewController(verificationVC, animated: true)
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

}
