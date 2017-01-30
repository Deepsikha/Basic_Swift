//
//  ViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet. /Users/itilak/Desktop/Basic_Swift/Demo_swift/Demo_swift/ViewController/SecondViewController.swiftAll rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var valueSentFromSignUPPage:String?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.isHidden = false
        // 3. Before displaying the value check if it contains data
        print("nthg")
    }
    
    @IBAction func ForwardAction(_ sender: UIButton) {
        print("Button tapped \u{1f44d}")
        let pw = pwd.text
        if (self.pwd.text?.isEmpty)! || (self.email.text?.isEmpty)! {
            let alt = UIAlertController(title: "Enter Value", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
        }

        if pw == "makein" {
        let vc = SecondViewController(nibName:"secondView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let alt = UIAlertController(title: "", message: "Wrong Password", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
            //        // 1. Instantiate SecondViewController
            //        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            //        // 2. Set self as a value to delegate
            //        secondViewController.delegate = self
            //
            //        // 3. Push SecondViewController
            //        self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
 
    @IBAction func signUPAction(_ sender: UIButton) {
        let vc = SignUPViewController(nibName: "SignUPView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

