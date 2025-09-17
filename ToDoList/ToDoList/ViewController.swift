//
//  ViewController.swift
//  ToDoList
//
//  Created by srisshar on 29/04/24.
//

import UIKit

enum segment {
    
    case x
    case y
    case h
}

class ViewController: UIViewController {
    
    @IBOutlet weak var appName: UILabel!
    lazy var shadowView : UIView = {
        let v = UIView()
        v.alpha = 0.90
        v.frame = view.bounds
        v.backgroundColor = UIColor(named: "Shadow")
        return v
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add light effect view
        view.addSubview(shadowView)
        view.bringSubviewToFront(shadowView)
        
        //set initial shadow: shadowOffset
        appName.alpha = 0
        appName.layer.shadowColor = UIColor.black.cgColor
        appName.layer.shadowRadius = 5
        appName.layer.shadowOpacity = 1
        appName.layer.shadowOffset = CGSize(width: 10, height: 0)
        
        rightShadow()
    }
    
    func rightShadow() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.appName.alpha = 0.75
            self.shadowView.alpha = 0.6
        } completion: { success in
            self.rightHalfBottomShadow()
        }
    }
    
    func rightHalfBottomShadow() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.appName.alpha = 1
            let trig = self.calcTrig(segment: .h, size: 10, angle: 22.5)
            let x = trig[.x]
            let y = trig[.y]
            self.appName.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.5
        } completion: { success in
            self.rightBottomShadow()
        }
    }
    
    func rightBottomShadow() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.appName.alpha = 1.5
            let trig = self.calcTrig(segment: .h, size: 10, angle: 45)
            let x = trig[.x]
            let y = trig[.y]
            self.appName.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.4
        } completion: { success in
            self.rightMoreBottomShadow()
        }
    }
    
    func rightMoreBottomShadow() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.appName.alpha = 2
            let trig = self.calcTrig(segment: .h, size: 10, angle: 67.5)
            let x = trig[.x]
            let y = trig[.y]
            self.appName.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.3
        } completion: { success in
            self.rightOtherBottomShadow()
        }
    }
    
    func rightOtherBottomShadow() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.appName.alpha = 2.5
            let trig = self.calcTrig(segment: .h, size: 10, angle: 90)
            let x = trig[.x]
            let y = trig[.y]
            self.appName.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.2
        } completion: { success in
            self.rightBottomShadow()
        }
    }

    
    func rightOtherSideBottomShadow() {
        UIView.animate(withDuration: 1, delay: 2, options: .curveLinear) {
            self.appName.alpha = 3
            let trig = self.calcTrig(segment: .h, size: 10, angle: 135)
            let x = trig[.x]
            let y = trig[.y]
            self.appName.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.1
        }
    }

    func calcTrig(segment: segment, size: CGFloat, angle: CGFloat) -> [segment : CGFloat] {
        switch segment {
        case .x:
            let x = size
            let y = tan(angle * .pi/180)*x
            let h = x/cos(angle * .pi/180)
            return [.x : x, .y : y, .h : h]
            
        case .y:
            let y = size
            let x = tan(angle * .pi/180)
            let h = y/sin(angle * .pi/180)
            return [.x : x, .y : y, .h : h]
            
        case .h:
            let h = size
            let x = cos(angle * .pi/180)*h
            let y = sin(angle * .pi/180)*h
            return [.x : x, .y : y, .h : h]
        }
    }

}

