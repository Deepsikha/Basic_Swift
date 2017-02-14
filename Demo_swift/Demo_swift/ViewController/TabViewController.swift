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

    //MARK: - Delegate Method
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
}
