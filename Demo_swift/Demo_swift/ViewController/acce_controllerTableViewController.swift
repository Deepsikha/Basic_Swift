//
//  acce_controllerTableViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/3/17.
//  Copyright © 2017 LaNet. All rights reserved.
//
import UIKit

class acce_controllerTableViewController: UITableViewController {
    let cellReuseIdentifier = "FourthScreenCell"
    var fruitList: [String] = Array()
    var fruitListGrouped = NSDictionary() as! [String : [String]]
    var sectionTitleList = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createData()
        self.splitDataInToSection()
    }
    
    // MARK: - Delegate Method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.fruitListGrouped.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = self.sectionTitleList[section]
        let fruits = self.fruitListGrouped[sectionTitle]
        return fruits!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // collect reusable cell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let cell:FourthScreenCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FourthScreenCell

        let sectionTitle = self.sectionTitleList[(indexPath as NSIndexPath).section]
        let fruits = self.fruitListGrouped[sectionTitle]
        cell.textLabel?.text = fruits![(indexPath as NSIndexPath).row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitleList[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.sectionTitleList
    }

    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    // MARK: - Utility functions
    
    fileprivate func createData() {
        
        // fill up data
        self.fruitList  = [
            "Strawberry",
            "Apple", "Apricot", "Avocado",
            "Banana", "Blueberry",
            "Coconut", "Custard Apple",
            "Dates", "Durian",
            "Fig",
            "Gooseberry", "Grapes", "Guava",
            "Jackfruit",
            "Lemon", "Lime", "Longan", "Lychee",
            "Mango",
            "Orange",
            "Papaya", "Pear", "Pineapple", "Pomogranate",
            "Raspberry",
            "Watermelon"
        ]
        
        // sort the array  (Important)
        self.fruitList = self.fruitList.sorted()
    }
    
    
    fileprivate func splitDataInToSection() {
        
        var sectionTitle: String = ""
        for i in 0..<self.fruitList.count {
            
            let currentRecord = self.fruitList[i]
            let firstChar = currentRecord[currentRecord.startIndex]
            let firstCharString = "\(firstChar)"
            if firstCharString != sectionTitle {
                sectionTitle = firstCharString
                self.fruitListGrouped[sectionTitle] = [String]()
                self.sectionTitleList.append(sectionTitle)
            }
            self.fruitListGrouped[firstCharString]?.append(currentRecord)
        }
    }
}
