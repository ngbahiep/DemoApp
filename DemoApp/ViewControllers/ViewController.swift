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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            let navigator = UINavigationController(rootViewController: homeVC)
            navigator.modalPresentationStyle = .fullScreen
            
            self.present(navigator, animated: false, completion: nil)
        }
    }

}
