//
//  ViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var Forward: UIButton!
    @IBOutlet var label: UILabel!
    @IBOutlet var email: UITextField!
    @IBOutlet var pwd: UITextField!
    @IBOutlet var submit: UIButton!
    @IBOutlet var NewAcc: UIButton!
    
    var valueSentFromSignUPPage:String?
    var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "LogIn")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "LOG IN"
        self.navigationController?.navigationBar.isHidden = true
        label.font = label.font.withSize(20)
        submit.layer.cornerRadius = 8
//        Forward.frame = CGRectMake(100, 100, 50, 50)
        //MyTableView.frame = CGRectMake(20, 50, 250, 400)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    
        // Animation
        label.center.y -= view.bounds.width
        email.center.x -= view.bounds.width
        pwd.center.x += view.bounds.width
        
        UIView.animate(withDuration: 2.0, delay: 0.5, animations: {self.label.center.y += self.view.bounds.width
            self.view.layoutIfNeeded()
        })
    
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.email.center.x += self.view.bounds.width
            self.pwd.center.x -= self.view.bounds.width
            self.submit.alpha = 0.5
            self.NewAcc.alpha = 0.8
        }, completion: nil)
    
        UIView.animate(withDuration: 3.0, delay: 2.0, options: [], animations: {self.submit.alpha = 1.0
        }, completion: nil)
    }
    
    //MARK: - ButtonAction
    @IBAction func ForwardAction(_ sender: UIButton) {
        print("Button tapped \u{1f44d}")
        
        let name = email.text
        let pw = pwd.text
        
        // Validation
        if (self.pwd.text?.isEmpty)! || (self.email.text?.isEmpty)! {
            let alt = UIAlertController(title: "Enter Value", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
        }
        // Login verification static
        if pw == "makein" ||  pw == "lanetteam1" && name == "dev_76" {
        let vc = SecondViewController(nibName:"secondView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let alt = UIAlertController(title: "", message: "Wrong Password", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
        }

        // Log in Verification using CoreData
//        _ = persistentContainer.viewContext
//        let userEmailStored = UserDefaults.standard.string(forKey: "username")
//        let passwordstored = UserDefaults.standard.string(forKey: "pwd")
//        
//        if pw == passwordstored && name == userEmailStored {
//            let vc = SecondViewController(nibName:"secondView", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }else{
//            let alt = UIAlertController(title: "", message: "Wrong Password", preferredStyle: UIAlertControllerStyle.alert)
//            alt.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//            self.present(alt, animated: true, completion: nil)
//        }
    }
 
    @IBAction func signUPAction(_ sender: UIButton) {
        let vc = SignUPViewController(nibName: "SignUPView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
        //Animation
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {
            self.submit.bounds = CGRect(x: UIScreen.main.bounds.origin.x - 20, y: UIScreen.main.bounds.origin.y, width: UIScreen.main.bounds.size.width + 60, height: UIScreen.main.bounds.size.height)
            self.submit.isEnabled = false
        }, completion: nil)
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10.0, options: [], animations: {
            self.submit.bounds = CGRect(x: UIScreen.main.bounds.origin.x - 20, y: UIScreen.main.bounds.origin.y, width: UIScreen.main.bounds.size.width + 60, height: UIScreen.main.bounds.size.height)
            self.submit.isEnabled = false
        }, completion: nil)
    }
    
    //MARK: - Delegate Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField == email)
        {
            pwd.becomeFirstResponder()
        }
        if (textField == pwd)
        {
            submit.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Next one !!!")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
