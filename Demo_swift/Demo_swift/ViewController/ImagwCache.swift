//
//  ImagwCache.swift
//  Demo_swift
//
//  Created by devloper65 on 2/20/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ImagwCache: UITableViewController {
    
    @IBOutlet var cacheTable: UITableView!
        var refreshCtrl: UIRefreshControl!
        var tabledata:[AnyObject]!
        var session:URLSession!
        var task:URLSessionDownloadTask!
        var cache:NSCache<AnyObject, AnyObject>!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.title = "imageCaching"
            cacheTable.register(UINib(nibName: "LazyCell", bundle: nil), forCellReuseIdentifier: "LazyCell")
            session = URLSession.shared
            task = URLSessionDownloadTask()
            
            self.refreshCtrl = UIRefreshControl()
            self.refreshCtrl.addTarget(self, action: #selector(ImagwCache.refreshtable), for: .valueChanged)
            self.refreshControl = self.refreshCtrl
            
            self.tabledata = []
            self.cache = NSCache()
        }
        
        func refreshtable() {
            
            let url:URL! = URL(string: "https://itunes.apple.com/search?term=flappy&entity=software")
            task = session.downloadTask(with: url, completionHandler: { (location: URL?, response: URLResponse?, error: Error?) -> Void in
                
                if location != nil{
                    let data:Data! = try? Data(contentsOf: location!)
                    do{
                        let dic = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as AnyObject
                        self.tabledata = dic.value(forKey : "results") as? [AnyObject]
                        DispatchQueue.main.async(execute: { () -> Void in
                            self.cacheTable.reloadData()
                            self.refreshCtrl?.endRefreshing()
                        })
                    }catch{
                        print("something went wrong, try again")
                    }
                }
            })
            task.resume()
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tabledata.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = cacheTable.dequeueReusableCell(withIdentifier: "LazyCell", for: indexPath) as! LazyCell
            
            let dictionary = self.tabledata[(indexPath as NSIndexPath).row] as! [String: AnyObject]
            
            cell.textLabel?.text = dictionary["trackName"] as? String
            cell.imageView?.image = UIImage(named: "placeholder")
            
            if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil) {
                print("Cache Image")
                cell.imageView?.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
            } else {
                let dicturl = dictionary["artworkUrl100"] as! String
                let url:URL! = URL(string: dicturl)
                
                task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                    if let data = try? Data(contentsOf: url){
                        // 4
                        DispatchQueue.main.async(execute: { () -> Void in
                            // 5
                            // Before we assign the image, check whether the current cell is visible
                            if let updateCell = tableView.cellForRow(at: indexPath) {
                                let img:UIImage! = UIImage(data: data)
                                updateCell.imageView?.image = img
                                self.cache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
                            }
                        })
                    }
                })
                task.resume()
            }
            return cell
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

