//
//  HistoryViewController.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 20/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var activities: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Activity")
        
        do {
            activities = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        tableView.reloadData()
        
        debugPrint("activities.count: \(activities.count)")
    }
    
    func convertToModel(activity: NSManagedObject) -> ModelActivity {
        
        let name = activity.value(forKeyPath: "name") as? String ?? ""
        let descriptions = activity.value(forKeyPath: "descriptions") as? String ?? ""
        let gps_location = activity.value(forKeyPath: "gps_location") as? String ?? ""
        let address = activity.value(forKeyPath: "address") as? String ?? ""
        var image: UIImage?
        
        if let imageData = activity.value(forKey: "image") as? Data {
            image = UIImage(data:imageData)
        }
        
        return ModelActivity(name: name, descriptions: descriptions, gpsLocation: gps_location, address: address, image: image)
    }

}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let addActivityVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddActivityViewController") as? AddActivityViewController {
            let activity = activities[indexPath.row]
            let activityModel = convertToModel(activity: activity)
            addActivityVC.modelActivity = activityModel
            
            let latlong = activityModel.gpsLocation.components(separatedBy: ",")
            debugPrint("latlong: \(latlong)")
            let latitude = Double(latlong[0])!
            let longtitude = Double(latlong[1].trimmingCharacters(in: .whitespacesAndNewlines))!
            let location = CLLocation(latitude:latitude, longitude: longtitude)
            addActivityVC.location = location
            
            self.navigationController?.pushViewController(addActivityVC, animated: true)
        }
    }
    
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HistoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        
        let activity = activities[indexPath.row]
        let activityModel = convertToModel(activity: activity)
        
        let activityViewModel = ActivityViewModel(activity: activityModel)
        activityViewModel.configure(view: cell)
        
        return cell
    }
    
}
