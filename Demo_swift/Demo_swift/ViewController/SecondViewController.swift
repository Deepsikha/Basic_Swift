//
//  SecondViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var forward1: UIButton!
    
    @IBOutlet var reverse1: UIButton!
        override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    @IBAction func forwardAction(_ sender: UIButton) {
        let vc = ThirdViewController(nibName: "thirdView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func reverseAction(_ sender: UIButton) {
//        let bc = ViewController(nibName: "view", bundle: nil)
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
