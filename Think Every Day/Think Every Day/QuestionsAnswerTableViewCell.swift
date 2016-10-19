//
//  QuestionsTableViewCell.swift
//  Think Every Day
//
//  Created by Mercy on 10/19/16.
//  Copyright © 2016 TED. All rights reserved.
//

import UIKit

class QuestionsAnswerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
