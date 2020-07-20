//
//  HistoryTableViewCell.swift
//  DemoApp
//
//  Created by Hiep Nguyen on 20/07/2020.
//  Copyright © 2020 Hiep. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivActivity: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescriptions: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
