//
//  LazyCell.swift
//  Demo_swift
//
//  Created by devloper65 on 2/18/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class LazyCell: UITableViewCell {

    @IBOutlet var lblLazy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
