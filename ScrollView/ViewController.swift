//
//  ViewController.swift
//  Scroll_View
//
//  Created by devloper65 on 2/2/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView = UIImageView(image: UIImage(named: "images.jpeg"))
        
        ScrollView = UIScrollView(frame: view.bounds)
        ScrollView.backgroundColor = UIColor.black
        ScrollView.contentSize = imageView.bounds.size
        ScrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        ScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        //ScrollView.contentOffset = CGPoint(x: 100, y: 450)
        ScrollView.addSubview(imageView)
        view.addSubview(ScrollView)
        ScrollView.delegate = self
        ScrollView.minimumZoomScale = 0.1
        ScrollView.maximumZoomScale = 4.0
        ScrollView.zoomScale = 1.0
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

