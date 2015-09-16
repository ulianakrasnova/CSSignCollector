//
//  RecordViewCellControllerTableViewCell.swift
//  Sign Collector
//
//  Created by User on 16.09.15.
//  Copyright (c) 2015 CodeSWAT. All rights reserved.
//

import UIKit

class RecordViewCellControllerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var signature: UIImageView!
    
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
