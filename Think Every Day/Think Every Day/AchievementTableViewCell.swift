//
//  AchievementTableViewCell.swift
//  Think Every Day
//
//  Created by Mercy on 10/19/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class AchievementTableViewCell: UITableViewCell {

    @IBOutlet weak var achievement: UILabel!
    
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
