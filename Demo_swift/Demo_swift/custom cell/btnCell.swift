//
//  btnCell.swift
//  Demo_swift
//
//  Created by devloper65 on 2/8/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class btnCell: UITableViewCell {

    @IBOutlet var btnScroll: UIScrollView!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var lbl2: UILabel!
    @IBOutlet var Upload: UIButton!
    @IBOutlet var Delete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //btnScroll.contentSize = CGSize(width: UIScreen.main.bounds.size.width + 200, height: 0)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
