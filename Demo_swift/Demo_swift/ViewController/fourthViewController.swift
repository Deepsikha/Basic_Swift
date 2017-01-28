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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addData(_ sender: UIButton) {
        //add your data into tables array from textField
        table1Data.append(table1Text.text!)
        table2Data.append(table2Text.text!)
        
        DispatchQueue.main.async(execute: { () -> Void in
            //reload your tableView
            self.table1.reloadData()
            self.table2.reloadData()
        })
        
        
        table1Text.resignFirstResponder()
        table2Text.resignFirstResponder()
    }
    
    //delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == table1 {
            return table1Data.count
        }else if tableView == table2 {
            return table2Data.count
        }
        return Int()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == table1 {
            let cell = table1.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! UITableViewCell
            
            let row = indexPath.row
            cell.textLabel?.text = table1Data[row]
            
            return cell
        }else if tableView == table2 {
            
            let cell = table2.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath as IndexPath) as! UITableViewCell
            
            let row = indexPath.row
            cell.textLabel?.text = table2Data[row]
            
            return cell
        }
        
        return UITableViewCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


