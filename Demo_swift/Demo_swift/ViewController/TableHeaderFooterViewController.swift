//
//  TableHeaderFooterViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/31/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class TableHeaderFooterViewController: UITableViewController {
    
    var textdata = [ "D", "A" , "B", "c"]
    var text : [String] = []
    var text1 : [String] = []
    var flag: Int = 0
    var i:Int = 0
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        var text = textdata.sorted (by: {$0 < $1})
        
        for strEtxt in text{
            if strEtxt.characters.first == text[i].characters.first{
                count += 1
                i += 1
            }else{
                flag += 1
            }
        }
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Delegate Method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return textdata.count
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = "a"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let Delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            print("Delete button tapped")
        }
        Delete.backgroundColor = .red
        
        return [Delete]
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch (section) {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        case 3:
            return "D"
        case 4:
            return "E"
        case 5:
            return "F"
        default:
            return "G"
        }
    }
}
