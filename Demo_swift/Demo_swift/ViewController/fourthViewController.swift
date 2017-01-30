//
//  fourthViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/28/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table1Text: UITextField!
    @IBOutlet var table2Text: UITextField!
    
    @IBOutlet var table1: UITableView!
    @IBOutlet var table2: UITableView!
    var table1Data = ["a"]
    var table2Data = ["1"]
    
    // These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    // These are the colors of the square views in our table view cells.
    // In a real project you might use UIImages.
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table1.delegate = self
        table1.dataSource = self
    }
    
    
    @IBAction func addData(_ sender: UIButton) {
        //add your data into tables array from textField
        table1Data.append(table1Text.text!)
        table2Data.append(table2Text.text!)
        
//        dispath_async(dispatch_get_main_queue(), { () -> Void in
//            self.table1.reloadData()
//            self.table2.reloadData()
//        })
//        DispatchQueue.main.async(execute: { () -> Void in
//            //reload your tableView
//            self.table1.reloadData()
//            self.table2.reloadData()
//        })
        
        
        table1Text.resignFirstResponder()
        table2Text.resignFirstResponder()
    }
    
    //delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.animals.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1 {
            return table1Data.count
        }else if tableView == table2 {
            return table2Data.count
        }
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.table1.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ListCell
        
        cell.backgroundColor = self.colors[indexPath.row]
        cell.lblname.text = self.animals[indexPath.row]
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reverse(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


