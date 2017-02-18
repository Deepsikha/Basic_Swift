//
//  SixViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/16/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class SixViewController: UIViewController {
    var imagecount = 0
    var imagelist: [String] = ["i1.jpeg","i2.jpeg","i3.jpeg","i4.jpeg","i5.jpeg"]
    @IBOutlet var stack: UIStackView!
    
    @IBOutlet var Add: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StackView"
        self.addImageToStack()
        
        self.addImageToStack()
    }
    @IBAction func AddImageAction(_ sender: UIBarButtonItem) {
        self.addImageToStack()

    }

    func addImageToStack() {
        let imagename = self.imagelist[self.imagecount]
        
        let newimage:UIImage = UIImage(named: imagename)!
        let newimageView = UIImageView(image: newimage)
        newimageView.contentMode = UIViewContentMode.scaleAspectFill
        newimageView.clipsToBounds = true
        self.stack.addArrangedSubview(newimageView)
        
        self.imagecount += 1
        
        if (imagecount > 5) {
                self.Add.isEnabled = true
        }
    }

}
