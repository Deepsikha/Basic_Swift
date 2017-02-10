//
//  animation.swift
//  Demo_swift
//
//  Created by devloper65 on 2/9/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class animation: UIViewController {

    @IBOutlet var animateView: UIView!
    
    var Square: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSquare()
        animateSquare()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawSquare() {
        let SquareSize = CGSize(width: 30, height: 30)
        let CenterPoint = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY - (SquareSize.height*7))
        let frame = CGRect(origin: CenterPoint, size: SquareSize)
        
        Square = UIView(frame: frame)
        Square.backgroundColor = UIColor.red
        
        animateView.addSubview(Square)
    }
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.animateView)
    }()
    
    lazy var gravity: UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    lazy var collider: UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
    }()
    
    lazy var DynamicItem: UIDynamicItemBehavior = {
        let lazyBehavior = UIDynamicItemBehavior()
        
        lazyBehavior.elasticity = 0.8
        return lazyBehavior
    }()
    
    func animateSquare() {
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
        animator.addBehavior(DynamicItem)
        
//        gravity.addItem(Square)
        collider.addItem(Square)
        gravity.addItem(Square)
        DynamicItem.addItem(Square)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
