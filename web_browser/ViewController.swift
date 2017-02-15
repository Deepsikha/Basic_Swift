//
//  ViewController.swift
//  Web_Browser
//
//  Created by devloper65 on 2/15/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {
    
    let urlString : String = "http://www.lanetteam.com"
    var u:String?
    
    @IBOutlet var myWebView: UIWebView!
    @IBOutlet var urlsearchbar: UITextField!
    @IBOutlet var mySpinner: UIActivityIndicatorView!
    
    // MARK: -- View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myWebView.delegate = self
        self.urlsearchbar.delegate = self
        self.myWebView.scalesPageToFit = true
        self.mySpinner.startAnimating()
        
        // load url content within webview
        if let urlToBrowse = URL(string: self.urlString) {
            let urlRequest = URLRequest(url: urlToBrowse)
            self.myWebView.loadRequest(urlRequest)
        }
        
    }
    
    //MARK: - Delegate Method
    func textFieldDidEndEditing(_ textField: UITextField) {
        goToWebUrl()
        mySpinner.startAnimating()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        urlsearchbar.resignFirstResponder()
        return true
    }
    
    func goToWebUrl() {
        var str = urlsearchbar.text!
        
        if (chek(str: str) && str.contains(".") && !str.contains(" ")){
            if(str.contains("www.")){
                str = "http://"+str
            }else{
                
                str = "http://www."+str
            }
        }else{
            if(str.contains(" ")){
                let s = str.replacingOccurrences(of: " ", with: "+")
                str = "https://www.google.com/search?q="+s
            }else{
                str = "https://www.google.com/search?q="+str
            }
            
        }
        print(str)
        let url = URL(string: str)
        let req = URLRequest(url: url!)
        myWebView.loadRequest(req)
    }
    
    func chek(str: String)-> Bool{
        let reg = "^[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9].[a-zA-Z]{2,6}$"
        return NSPredicate(format: "SELF MATCHES %@", reg).evaluate(with: str)
    }
    
    //MARK: - Button Action
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
    
    @IBAction func forwardAction(_ sender: UIBarButtonItem) {
        if myWebView.canGoForward {
            myWebView.goForward()
        }
    }
    
    @IBAction func stopAction(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func refreshButtonAction(_ sender: UIBarButtonItem) {
        self.mySpinner.startAnimating()
        self.myWebView.reload()
    }
    
    // MARK: - Web view delegate function
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.mySpinner.stopAnimating()
    }
    
    
}
