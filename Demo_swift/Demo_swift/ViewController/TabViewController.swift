//
//  TabViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/9/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class TabViewController: UIViewController, UITabBarDelegate {


    @IBOutlet var tabbar: UITabBar!
    @IBOutlet var mainView: UIView!
    var animated = animation()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch (item.tag) {
        case 1:
            animated.viewDidLoad()
            mainView.addSubview(animated.Square)
            
            break;
        case 2:
            break;
        case 3:
            break;
        default:
            break;
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        
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
