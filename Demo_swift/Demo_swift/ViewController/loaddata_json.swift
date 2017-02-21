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
    var cellReuseIdentifier = "FourthScreenCell"
    var strTitle:NSString = ""
    
    @IBOutlet var TableViewJson: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "JSON"
       
        TableViewJson.register(UINib(nibName: "FourthScreenCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
//         self.clearsSelectionOnViewWillAppear = false
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.parsingdata()
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
    
    // MARK: - Delegate Method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDict.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* for insert data into accesnding order.
         
         cell.imgView.image = UIImage(named: ((jsonDict[indexPath.row] as AnyObject).value(forKey: "image") as? String)!)
         cell.lblName.text = (jsonDict[indexPath.row] as AnyObject).value(forKey: "name") as? String
         cell.lblSubtitle.text = age1[indexPath.section][indexPath.row]
         return cell
         */
        
        //directily insert data without sorting.
        let cell:FourthScreenCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FourthScreenCell
        
        let strTitle : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "TITLE") as! NSString
        
        let strDescription : NSString=(arrDict[indexPath.row] as AnyObject).value(forKey: "DETAILS") as! NSString
        
        let time : NSString = (arrDict[indexPath.row] as AnyObject).value(forKey: "TIME") as! NSString
        
        cell.lblCell.text=strTitle as String
        cell.lblCell1.text=strDescription as String
        cell.lblCell2.text=time as String
        
//        cell.lbl1.text = strTitle as String
//        cell.lbl2.text = strDescription as String
        
        return cell
    }
        /* edit cell action using by third party library.
         
        let reuseIdentifier = "programmaticCell"
        var cell = self.table.dequeueReusableCellWithIdentifier(reuseIdentifier) as! MGSwipeTableCell!
        if cell == nil
        {
            cell = MGSwipeTableCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        cell.textLabel!.text = "Title"
        cell.detailTextLabel!.text = "Detail text"
        cell.delegate = self //optional
        
        //configure left buttons
        cell.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named:"check.png"), backgroundColor: UIColor.greenColor())
            ,MGSwipeButton(title: "", icon: UIImage(named:"fav.png"), backgroundColor: UIColor.blueColor())]
        cell.leftSwipeSettings.transition = MGSwipeTransition.Rotate3D
        
        //configure right buttons
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: UIColor.redColor())
            ,MGSwipeButton(title: "More",backgroundColor: UIColor.lightGrayColor())]
        cell.rightSwipeSettings.transition = MGSwipeTransition.Rotate3D
        
        return cell
     }
        */
    /* Right Button
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        
        // edit action using by default property
        let Edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            print("Edit button tapped")
        }
        Edit.backgroundColor = .lightGray
        
        let Delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("Delete button tapped")
        }
        Delete.backgroundColor = .red
        
        return [Delete, Edit]
    }
    */
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("select")
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "NEXT"
    }
    //MARK: - Write Data into File
    /*   Function for Write Data into File.
    func wrt(json: AnyObject){
        print("ABCD")
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            let convertedString = String(data: data1, encoding: String.Encoding.utf8) // the data will be converted to the string
            print(convertedString!) // <-- here is ur string
            let text = "{\n\t\"person\":"+convertedString!+"\n}"
            
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                
                let path = "/Users/itilak/Desktop/swift/sampleproject/sampleproject/1.json"
                
                do {
                    try text.write(toFile: path,  atomically: true, encoding: String.Encoding.utf8)
                    print("Successful")
                }
                catch {
                    print("Writing not performed")
                }
            }
            else{
                print("Success")
            }
        }
        catch{
            print("Error")
        }
    }
    */
}
