//
//  SignUPViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/28/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func passvalue(valueSent:String?)
}

class SignUPViewController: UIViewController {

    @IBOutlet var firstname: UITextField!
    @IBOutlet var lastname: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var pwd: UITextField!
    @IBOutlet var pwd1: UITextField!
    @IBOutlet var su: UILabel!
    
    var delegate:MyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SIGN UP"
        self.navigationController?.navigationBar.isHidden = false
//          su.font = su.font.withSize(50)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUPAction(_ sender: UIButton) {
        if self.firstname.text!.isEmpty || self.lastname.text!.isEmpty || self.username.text!.isEmpty || self.pwd.text!.isEmpty || self.pwd1.text!.isEmpty {
            let alt = UIAlertController(title: "Enter Value", message: "All Fields are Mandatory", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
            
        }else if pwd.text != pwd1.text{
            let alt = UIAlertController(title: "Confirm Password", message: "Password Can't match, Enter Same Password", preferredStyle: UIAlertControllerStyle.alert)
            alt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            self.present(alt, animated: true, completion: nil)
        }else {
            _ = self.firstname.text
            let vc = ViewController(nibName: "View", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let pd = pwd.text
        delegate?.passvalue(valueSent: pd)
    }
      /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
