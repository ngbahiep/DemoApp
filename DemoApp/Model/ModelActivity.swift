//
//  ModelActivity.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 19/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import CoreData

class ModelActivity: NSObject {

    public var name: String
    public var descriptions: String
    public var gpsLocation: String
    public var address: String
    public var image: UIImage?
    
    init(name: String, descriptions: String, gpsLocation: String, address: String, image: UIImage?) {
        self.name = name
        self.descriptions = descriptions
        self.gpsLocation = gpsLocation
        self.address = address
        self.image = image
    }
    
    public func save() {
        // Save to CoreData
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: context)
        
        entity.setValue(name, forKeyPath: "name")
        entity.setValue(descriptions, forKeyPath: "descriptions")
        entity.setValue(gpsLocation, forKeyPath: "gps_location")
        entity.setValue(address, forKeyPath: "address")
        if let image = image {
            let imageData = image.pngData()
            entity.setValue(imageData, forKey: "image")
        }
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
}
