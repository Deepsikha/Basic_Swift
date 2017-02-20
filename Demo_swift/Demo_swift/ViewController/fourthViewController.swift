//
//  fourthViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/28/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {

    var table1Data = ["a"]
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    let cellReuseIdentifier = "FourthScreenCell"
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    @IBOutlet var tableView1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.register(UINib(nibName: "FourthScreenCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            self.tableView1.tableHeaderView = controller.searchBar
            
            return controller
        })()
        self.tableView1.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        animateTable()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func animateTable() {
        tableView1.reloadData()
        
        let cells = tableView1.visibleCells
        let tableHeight: CGFloat = tableView1.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
    
    // MARK: - Delegate Methods
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.isActive) {
            return self.filteredTableData.count
        } else {
        return self.animals.count
        }
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//
        let cell:FourthScreenCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FourthScreenCell
//        let cell:ListCell = self.table1.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ListCell
        if (self.resultSearchController.isActive) {
            cell.lblCell?.text = filteredTableData[indexPath.row]
            
            return cell
        }else{
        cell.backgroundColor = self.colors[indexPath.row]
        cell.lblCell.text = self.animals[indexPath.row]
        
        return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        c
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        label.text = "Users"
        label.textColor = UIColor.white
        self.view.addSubview(view)
        return view
        
    }

    func updateSearchResults(for searchController: UISearchController) {
        
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (animals as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView1.reloadData()
    }
    
    //MARK: - Button Action
    @IBAction func reverse(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func Logout(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
