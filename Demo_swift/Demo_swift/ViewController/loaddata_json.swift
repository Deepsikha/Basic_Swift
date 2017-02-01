//
//  loaddata_json.swift
//  Demo_swift
//
//  Created by devloper65 on 2/1/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class loaddata_json: UITableViewController {
    
    var arrDict :NSMutableArray=[]
    
    let cellReuseIdentifier = "FourthScreenCell"

    @IBOutlet var TableViewJson: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellReuseIdentifier = "FourthScreenCell"
        
        TableViewJson.register(UINib(nibName: "FourthScreenCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        
         self.clearsSelectionOnViewWillAppear = false

         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        parsingdata()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle = .delete {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func parsingdata() {
        let path:NSString = Bundle.main.path(forResource: "days", ofType: "json")! as NSString
        
        let data : Data = try! Data(contentsOf: URL(fileURLWithPath: path as String), options: NSData.ReadingOptions.dataReadingMapped)
        
        self.start_parse(data)

    }
    
    func start_parse(_ data :Data) {
        let dict: NSDictionary!=(try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
        
        for i in 0  ..< (dict.value(forKey: "MONDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "MONDAY") as! NSArray) .object(at: i))
        }
        for i in 0  ..< (dict.value(forKey: "TUESDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "TUESDAY") as! NSArray) .object(at: i))
        }
        for i in 0  ..< (dict.value(forKey: "WEDNESDAY") as! NSArray).count
        {
            arrDict.add((dict.value(forKey: "WEDNESDAY") as! NSArray) .object(at: i))
        }
        TableViewJson .reloadData()
    }
    
        // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrDict.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FourthScreenCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FourthScreenCell
        
        let strTitle : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "TITLE") as! NSString
        
        let strDescription : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "DETAILS") as! NSString
        cell.lblCell.text=strTitle as String
        cell.lblcell1.text=strDescription as String
        return cell
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
