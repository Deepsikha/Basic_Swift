//
//  btnController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/8/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class btnController: UITableViewController {
    
    var lblText1 = ["A","B","C"]
    var lblText2 = ["a","b","c"]
    
    @IBOutlet var btnTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTable.register(UINib(nibName: "btnCell", bundle: nil), forCellReuseIdentifier: "btnCell")
    }

    // MARK: - Delegate Method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lblText2.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:btnCell  = tableView.dequeueReusableCell(withIdentifier: "btnCell", for: indexPath) as! btnCell

        // Configure the cell...
//        cell.lbl1.text = lblText1 as String
//        cell.lbl2.text = lblText2 as String
        return cell
    }
    
}
