//
//  ThirdViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableViewController: UITableView!
    @IBOutlet var textData: UITextField!
    
    var tableData = ["Try It..."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    
    //MARK: - Animation
    func animateTable() {
        tableViewController.reloadData()
        
        let cells = tableViewController.visibleCells
        let tableHeight: CGFloat = tableViewController.bounds.size.height
        
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
    
    //MARK: - Button Action
    @IBAction func reverseAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forwardAction(_ sender: UIButton) {
        let vc = fourthViewController(nibName: "fourthView", bundle: nil)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func reverse_to_home(_ sender: UIButton) {
//        self.navigationController?.popToViewController((self.navigationController?.viewControllers[1])!, animated: true)
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    @IBAction func addData(_ sender: UIButton) {
        tableData.append(textData.text!)
        //textData.resignFirstResponder()
        tableViewController.reloadData()
    }
    
    //MARK: - Delegate Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let row = indexPath.row
        cell.textLabel?.text = tableData[row]
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        return cell
    }
    
}
