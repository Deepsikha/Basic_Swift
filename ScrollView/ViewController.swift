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
        imageView = UIImageView(image: UIImage(named: "best.jpg"))
//        imageView.backgroundColor = .red
//        ScrollView.backgroundColor = .black
        ScrollView = UIScrollView(frame: view.bounds)
        ScrollView.backgroundColor = UIColor.black
        ScrollView.contentSize = imageView.bounds.size
        ScrollView.autoresizingMask = UIViewAutoresizing.flexibleWidth
        ScrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        ScrollView.contentOffset = CGPoint(x: 1000, y: 450)
       
        ScrollView.delegate = self
        ScrollView.minimumZoomScale = 0.1
        ScrollView.maximumZoomScale = 1.0
        ScrollView.zoomScale = 1.0
        
        ScrollView.addSubview(imageView)
        view.addSubview(ScrollView)
        
        setZoomScale()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    
    func setupGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleDoubleTap(_:)))
        doubleTap.numberOfTapsRequired = 2
        ScrollView.addGestureRecognizer(doubleTap)
    }
    
    
    @IBAction func handleDoubleTap(_ sender: UITapGestureRecognizer) {
        if (ScrollView.zoomScale > ScrollView.minimumZoomScale) {
            ScrollView.setZoomScale(ScrollView.minimumZoomScale, animated: true)
        } else {
            ScrollView.setZoomScale(ScrollView.maximumZoomScale, animated: true)
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let imageViewSize = imageView.frame.size
        let scrollViewSize = ScrollView.frame.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.width ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        ScrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let ScrollViewSize = ScrollView.bounds.size
        let widthScale = ScrollViewSize.width / imageViewSize.width
        let heightScale = ScrollViewSize.height / imageViewSize.width
        
        ScrollView.minimumZoomScale = min(widthScale,heightScale)
        ScrollView.zoomScale = 1.0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

