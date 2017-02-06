//
//  MasterViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/6/17.
//  Copyright © 2017 LaNet. All rights reserved.
//


import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var objects = NSMutableArray()

    @IBOutlet weak var tableView: SBGestureTableView!
    
    let checkIcon = FAKIonIcons.ios7CheckmarkIcon(withSize: 30)
    let closeIcon = FAKIonIcons.ios7CloseIcon(withSize: 30)
    let composeIcon = FAKIonIcons.ios7ComposeIcon(withSize: 30)
    let clockIcon = FAKIonIcons.ios7ClockIcon(withSize: 30)
    let greenColor = UIColor(red: 85.0/255, green: 213.0/255, blue: 80.0/255, alpha: 1)
    let redColor = UIColor(red: 213.0/255, green: 70.0/255, blue: 70.0/255, alpha: 1)
    let yellowColor = UIColor(red: 236.0/255, green: 223.0/255, blue: 60.0/255, alpha: 1)
    let brownColor = UIColor(red: 182.0/255, green: 127.0/255, blue: 78.0/255, alpha: 1)
 
    var removeCellBlock: ((SBGestureTableView, SBGestureTableViewCell) -> Void)!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MasterViewController.insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton

        setupIcons()
        tableView.didMoveCellFromIndexPathToIndexPathBlock = {(fromIndexPath: IndexPath, toIndexPath: IndexPath) -> Void in
            self.objects.exchangeObject(at: toIndexPath.row, withObjectAt: fromIndexPath.row)
        }
        removeCellBlock = {(tableView: SBGestureTableView, cell: SBGestureTableViewCell) -> Void in
            let indexPath = tableView.indexPath(for: cell)
            self.objects.removeObject(at: indexPath!.row)
            tableView.removeCell(cell, duration: 0.3, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupIcons() {
        checkIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        closeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        composeIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
        clockIcon?.addAttribute(NSForegroundColorAttributeName, value: UIColor.white)
    }
    
    func insertNewObject(_ sender: AnyObject) {
        objects.insert(Date(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row] as! Date
            (segue.destination as! DetailViewController).detailItem = object as AnyObject?
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

    // MARK: - Table View

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let size = CGSize(width: 30, height: 30)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SBGestureTableViewCell
        
        cell.firstLeftAction = SBGestureTableViewCellAction(icon: (checkIcon?.image(with: size))!, color: greenColor, fraction: 0.3, didTriggerBlock: removeCellBlock)
        cell.secondLeftAction = SBGestureTableViewCellAction(icon: (closeIcon?.image(with: size))!, color: redColor, fraction: 0.6, didTriggerBlock: removeCellBlock)
        cell.firstRightAction = SBGestureTableViewCellAction(icon: (composeIcon?.image(with: size))!, color: yellowColor, fraction: 0.3, didTriggerBlock: removeCellBlock)
        cell.secondRightAction = SBGestureTableViewCellAction(icon: (clockIcon?.image(with: size))!, color: brownColor, fraction: 0.6, didTriggerBlock: removeCellBlock)
        
        let object = objects[indexPath.row] as! Date
        cell.textLabel!.text = object.description
        return cell
    }

}

