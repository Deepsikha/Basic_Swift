//
//  fourthViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/28/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class fourthViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   
    var table1Data = ["a"]
    @IBOutlet var tableView1: UITableView!

    // These strings will be the data for the table view cells
    let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    // These are the colors of the square views in our table view cells.
    // In a real project you might use UIImages.
    let colors = [UIColor.blue, UIColor.yellow, UIColor.magenta, UIColor.red, UIColor.brown]
    
    // Don't forget to enter this in IB also
    let cellReuseIdentifier = "FourthScreenCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.register(UINib(nibName: "FourthScreenCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
    }

    override func viewWillAppear(_ animated: Bool) {
        animateTable()
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
    
    //delegate methods
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//
        let cell:FourthScreenCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! FourthScreenCell
//        let cell:ListCell = self.table1.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ListCell
        cell.backgroundColor = self.colors[indexPath.row]
        cell.lblCell.text = self.animals[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 18))
        
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        label.text = "Users"
        label.textColor = UIColor.white
        self.view.addSubview(view)
        return view
        
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


