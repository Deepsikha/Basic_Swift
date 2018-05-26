//
//  LazyLoadingController.swift
//  Demo_swift
//
//  Created by devloper65 on 2/18/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class LazyLoadingController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var LazyTable: UITableView!
    var tableData: Array < String > = Array < String >()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lazy Loading"
        LazyTable.delegate = self
        LazyTable.dataSource = self
        LazyTable.register(UINib(nibName: "LazyCell", bundle: nil), forCellReuseIdentifier: "LazyCell")
        Send("http://127.0.0.1:8080/api/bears")
        Get("http://127.0.0.1:8080/api/bears")
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:LazyCell = LazyTable.dequeueReusableCell(withIdentifier: "LazyCell", for: indexPath) as! LazyCell
        
        cell.lblLazy.text = tableData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(tableData[indexPath.row] != "")
        {
            print("Send Data Req")
        }
    }
    
    func Send(_ link:String) {
        let parameters = ["name":"dev_76", "password":"makein"] as Dictionary<String, String>
        
        let req = NSMutableURLRequest(url: NSURL(string: link)! as URL)
        
        let session = URLSession.shared
        req.httpMethod = "POST"
        
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = session.dataTask(with: req as URLRequest) { data, response, error in
            guard data != nil else {
                print("no data found: \(error)")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    print("Response: \(json)")
                } else {
                    let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    print("Error could parse JSON: \(jsonStr)")
                }
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Error could not parse JSON: '\(jsonStr)'")
            }
        }
        LazyTable.reloadData()
        task.resume()
    }

    func Get(_ link: String) {
        let url:URL = URL(string: link)!
        let session = URLSession.shared
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(
            data, response, error) in
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                    return
            }
            self.extract_json(data!)
        })
        task.resume()
    }

    func extract_json(_ data: Data)
    {
        let json: Any?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        }
        catch {
            return
        }
        guard let data_list = json as? NSArray else {
            return
        }
        if let countries_list = json as? NSArray {
            for i in 0 ..< data_list.count {
                if let country_obj = countries_list[i] as? NSDictionary {
                if let name = country_obj["name"] as? String {
                    if (country_obj["password"] as? String) != nil {
                        tableData.append("Name: " + name)
                        }
                    }
                }
            }
        }
        DispatchQueue.main.async(execute: {self.LazyTable.reloadData()})
    }
}


