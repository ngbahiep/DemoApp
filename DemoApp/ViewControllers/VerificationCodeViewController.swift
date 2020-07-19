//
//  VerificationCodeViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 19/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import Firebase

class VerificationCodeViewController: UIViewController {
    
    @IBOutlet weak var vVerificationCode: UIView!
    @IBOutlet weak var btnCommit: UIButton!
    
    var txtVerificationCode: SkyFloatingLabelTextField!
    
    var phoneNumber: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCommit.layer.cornerRadius = 30
        
        if nil == txtVerificationCode {
            txtVerificationCode = SkyFloatingLabelTextField(frame: vVerificationCode.frame)
            txtVerificationCode.placeholder = "Verification Code"
            txtVerificationCode.title = "Verification Code"
            txtVerificationCode.textContentType = .oneTimeCode
            txtVerificationCode.keyboardType = .phonePad
            self.view.addSubview(txtVerificationCode)
        }
        
        txtVerificationCode.becomeFirstResponder()
        
        // verify phone number
//        verifyPhoneNumber(phoneNumber: phoneNumber)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func touchedOnConfirm(sender: UIButton) {
        
        let verificationCode = txtVerificationCode.text ?? ""
        
        if verificationCode.count < 6 {
            txtVerificationCode.errorMessage = "Verification Code is not valid"
            return
        }
        
//        let verificationID = UserDefaults.standard.string(forKey: "authVerificationID")!
//        let credential = PhoneAuthProvider.provider().credential(
//            withVerificationID: verificationID,
//            verificationCode: verificationCode)
        
        
//        Auth.auth().signIn(with: credential) { (authResult, error) in
//            if let error = error {
                //              let authError = error as NSError
                //              if (isMFAEnabled && authError.code == AuthErrorCode.secondFactorRequired.rawValue) {
                //                // The user is a multi-factor user. Second factor challenge is required.
                //                let resolver = authError.userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
                //                var displayNameString = ""
                //                for tmpFactorInfo in (resolver.hints) {
                //                  displayNameString += tmpFactorInfo.displayName ?? ""
                //                  displayNameString += " "
                //                }
                //                self.showTextInputPrompt(withMessage: "Select factor to sign in\n\(displayNameString)", completionBlock: { userPressedOK, displayName in
                //                  var selectedHint: PhoneMultiFactorInfo?
                //                  for tmpFactorInfo in resolver.hints {
                //                    if (displayName == tmpFactorInfo.displayName) {
                //                      selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
                //                    }
                //                  }
                //                  PhoneAuthProvider.provider().verifyPhoneNumber(with: selectedHint!, uiDelegate: nil, multiFactorSession: resolver.session) { verificationID, error in
                //                    if error != nil {
                //                      print("Multi factor start sign in failed. Error: \(error.debugDescription)")
                //                    } else {
                //                      self.showTextInputPrompt(withMessage: "Verification code for \(selectedHint?.displayName ?? "")", completionBlock: { userPressedOK, verificationCode in
                //                        let credential: PhoneAuthCredential? = PhoneAuthProvider.provider().credential(withVerificationID: verificationID!, verificationCode: verificationCode!)
                //                        let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator.assertion(with: credential!)
                //                        resolver.resolveSignIn(with: assertion!) { authResult, error in
                //                          if error != nil {
                //                            print("Multi factor finanlize sign in failed. Error: \(error.debugDescription)")
                //                          } else {
                //                            self.navigationController?.popViewController(animated: true)
                //                          }
                //                        }
                //                      })
                //                    }
                //                  }
                //                })
                //              } else {
                //                self.displayError(error.localizedDescription)
                //                return
                //              }
                //              // ...
//
//                self.displayError(error: error.localizedDescription)
//                return
//            }
//
//            debugPrint("debugPrint: \(authResult)")
//
//        }
        
        
        
        if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            let navigator = UINavigationController(rootViewController: homeVC)
            navigator.modalPresentationStyle = .fullScreen
            
            self.present(navigator, animated: true, completion: nil)
        }
    }
    
    func verifyPhoneNumber(phoneNumber: String) {
        print("Verify Phonenumber: \(phoneNumber)")
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print(error)
                self.displayError(error: error.localizedDescription)
                return
            }

            print("verificationID \(verificationID)")
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
        }
    }
    
    func displayError(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { (uiAlertAction) in
            alert.dismiss(animated: true, completion: nil)
        }

        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

}
