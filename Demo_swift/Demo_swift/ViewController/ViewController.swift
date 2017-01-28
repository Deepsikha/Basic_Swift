//
//  ViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet. /Users/itilak/Desktop/Basic_Swift/Demo_swift/Demo_swift/ViewController/SecondViewController.swiftAll rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var Forward: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC"
        self.navigationController?.navigationBar.isHidden = true
        
//        Forward.frame = CGRectMake(100, 100, 50, 50)
        //MyTableView.frame = CGRectMake(20, 50, 250, 400)
    }

    @IBAction func ForwardAction(_ sender: UIButton) {
        print("Button tapped \u{1f44d}")
        let vc = SecondViewController(nibName:"secondView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
}

