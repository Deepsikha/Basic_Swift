//
//  webView.swift
//  Demo_swift
//
//  Created by devloper65 on 2/14/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class webView: UIViewController, UIWebViewDelegate {


    @IBOutlet var webView: UIWebView!
    @IBOutlet var Activity: UIActivityIndicatorView!
    var url: String = "www.lanetteam.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Activity.startAnimating()
        
        if let urlToBrowse = URL(string: self.url) {
            let urlRequest = URLRequest(url: urlToBrowse)
            self.webView.loadRequest(urlRequest)
        }
        view.addSubview(webView)
    }
    
    // MARK: - Delegate Method
    func webViewDidFinishLoad(_ webView: UIWebView){
        self.Activity.stopAnimating()
    }
    
    //MARK: - Button Action
    @IBAction func BackAciton(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }

    @IBAction func ForwardAction(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func Refersh(_ sender: UIBarButtonItem) {
        self.Activity.startAnimating()
        self.webView.reload()
    }
    
    @IBAction func Stop(_ sender: UIBarButtonItem) {
        webView.stopLoading()
    }
    
}
