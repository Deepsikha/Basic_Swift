//
//  RatingController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/27/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class RatingController: UIStackView {
    
    private var ratingbt = [UIButton]()
    
    var rating = 0
    override init(frame: CGRect){
        super.init(frame: frame)
        setbutton()
    }
    
    required init(coder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setbutton()
    }
    
    //MARK: methods
    
    private func setbutton(){
        
        for _ in 0..<5 {
            let bt = UIButton()
            bt.backgroundColor = UIColor.red
            bt.translatesAutoresizingMaskIntoConstraints = false
            bt.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            bt.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
            bt.addTarget(self, action: #selector(RatingController.ratingButtonTaped(Button:)), for: .touchUpInside)
            
            addArrangedSubview(bt)
            addSubview(bt)

            ratingbt.append(bt)
            print(ratingbt.index(after: 0))
        }
        layoutIfNeeded()
        print("Button pressed \u{1f44d}")

    }
    func ratingButtonTaped(Button: UIButton){
        print("Button pressed \u{1f44d}")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
