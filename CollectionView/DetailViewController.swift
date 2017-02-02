//
//  DetailViewController.swift
//  CollectionViewDemo
//
//  Created by devloper65 on 2/2/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    var fruit : Fruit?
    override func viewDidLoad() {
        super.viewDidLoad()

        if let fruit = fruit {
            navigationItem.title = fruit.name?.capitalized
            imageView.image = UIImage(named: fruit.name!.lowercased())
        }
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
