//
//  AddActivityViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 18/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import CoreLocation
import CoreData

class AddActivityViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var vName: UIView!
    @IBOutlet weak var vDescription: UIView!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnTakePhoto: UIButton!
    
    var txtName: SkyFloatingLabelTextField!
    var txtDescription: SkyFloatingLabelTextField!
    
    var location: CLLocation?
    var address: String?
    
    var modelActivity: ModelActivity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let modelActivity = modelActivity {
            self.title = "Activity"
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if nil == txtName {
            txtName = SkyFloatingLabelTextField(frame: vName.frame)
            txtName.placeholder = "Activity Name"
            txtName.title = "Activity Name"
            txtName.returnKeyType = .done
            txtName.delegate = self
            self.view.addSubview(txtName)
        }
        
        if nil == txtDescription {
            txtDescription = SkyFloatingLabelTextField(frame: vDescription.frame)
            txtDescription.placeholder = "Activity Desciption"
            txtDescription.title = "Activity Desciption"
            txtDescription.returnKeyType = .done
            txtDescription.delegate = self
            self.view.addSubview(txtDescription)
        }
        
        if let modelActivity = modelActivity {
            
            self.title = "Activity"
            
            btnSubmit.isHidden = true
            btnTakePhoto.isHidden = true
            self.lblAddress.text = modelActivity.address
            self.txtName.text = modelActivity.name
            self.txtDescription.text = modelActivity.descriptions
            self.imageView.image = modelActivity.image
            
        } else {
            btnSubmit.layer.cornerRadius = 30
            
            if let location = location {
                self.lblLocation.text = String(format: "%f, %f", location.coordinate.latitude, location.coordinate.longitude)
            }
            
            if let address = address {
                self.lblAddress.text = address
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    @IBAction func touchedOnCamera(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .camera
        picker.cameraDevice = .rear
        self.present(picker, animated: true) {
            
        }
    }
    
    @IBAction func touchedOnSubmit(sender: UIButton) {
        let name = txtName.text ?? ""
        let descriptions = txtDescription.text ?? ""
        let gpsLocation = lblLocation.text ?? ""
        let address = lblAddress.text ?? ""
        
        let modelActivity = ModelActivity(name: name, descriptions: descriptions, gpsLocation: gpsLocation, address: address, image: imageView.image)
        modelActivity.save()
    }

}

extension AddActivityViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        print("didFinishPickingMediaWithInfo")
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("Image not found!")
            return
        }
        imageView.image = selectedImage
    }
}

extension AddActivityViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField .resignFirstResponder()
        return true
    }
}
