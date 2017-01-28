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
    @IBOutlet var label: UILabel!
    @IBOutlet var email: UITextField!
    @IBOutlet var pwd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC"
        self.navigationController?.navigationBar.isHidden = true
        label.font = label.font.withSize(20)
//        Forward.frame = CGRectMake(100, 100, 50, 50)
        //MyTableView.frame = CGRectMake(20, 50, 250, 400)
    }

    @IBAction func ForwardAction(_ sender: UIButton) {
        print("Button tapped \u{1f44d}")
        let pw = pwd.text
        if pw == "makein" {
        let vc = SecondViewController(nibName:"secondView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: false)
        }else{
            let alt = UIAlertController(title: "", message: "Wrong Password", preferredStyle: UIAlertControllerStyle.alert)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
}

