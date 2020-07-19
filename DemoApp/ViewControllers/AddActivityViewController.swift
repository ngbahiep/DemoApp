//
//  AddActivityViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 18/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class AddActivityViewController: UIViewController {

    @IBOutlet weak var vName: UIView!
    @IBOutlet weak var vDescription: UIView!
    var txtName: SkyFloatingLabelTextField!
    var txtDescription: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        txtName = SkyFloatingLabelTextField(frame: vName.frame)
        txtName.placeholder = "Activity Name"
        txtName.title = "Activity Name"
        self.view.addSubview(txtName)
        
        txtDescription = SkyFloatingLabelTextField(frame: vDescription.frame)
        txtDescription.placeholder = "Activity Desciption"
        txtDescription.title = "Activity Desciption"
        self.view.addSubview(txtDescription)
    }

    

}
