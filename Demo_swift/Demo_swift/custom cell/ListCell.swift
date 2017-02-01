//
//  ListCell.swift
//  Demo_swift
//
//  Created by devloper65 on 1/30/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var cellimage: UIImageView!
    @IBOutlet var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
