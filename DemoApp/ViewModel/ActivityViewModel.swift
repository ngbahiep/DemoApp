//
//  ActivityViewModel.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 20/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

class ActivityViewModel {

    private let activity: ModelActivity
    
    init(activity: ModelActivity) {
        self.activity = activity
    }
    
    public func configure(view: HistoryTableViewCell) {
        
        view.lblName.text = activity.name
        view.lblDescriptions.text = activity.descriptions
        if let image = activity.image {
            view.ivActivity.image = image
        }
        
    }
    
}
