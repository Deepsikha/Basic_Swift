//
//  ButtonCell.swift
//  Demo_swift
//
//  Created by devloper65 on 2/3/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell, UIScrollViewDelegate {


    @IBOutlet var lbl: UILabel!
    @IBOutlet var lblCell: UILabel!
    @IBOutlet var lblCell2: UILabel!
    @IBOutlet var btnScrollView: UIScrollView!
    func Load() {
        
    
    btnScrollView = UIScrollView(frame: self.bounds)
    btnScrollView.backgroundColor = UIColor.black
    //btnScrollView.contentSize = imageView?.bounds.size
    btnScrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
    btnScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
    
    btnScrollView.contentOffset = CGPoint(x: 50, y: 0)
    
    btnScrollView.delegate = self
    btnScrollView.minimumZoomScale = 0.1
    btnScrollView.maximumZoomScale = 1.0
    btnScrollView.zoomScale = 1.0
    
    //btnScrollView.addSubview(imageView)
    self.addSubview(btnScrollView)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
