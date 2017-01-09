//
//  SideBarView.swift
//  Starfly
//
//  Created by Arturs Derkintis on 15/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import UIKit
import SnapKit

class SideBarView: UIView, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var starflyLogoImageView : UIImageView!
    @IBOutlet weak var containerView : UIView!{
        didSet{
            let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panView(sender:)))
            panGestureRec.delegate = self
            containerView.addGestureRecognizer(panGestureRec)
        }
    }
    
    @IBOutlet weak var sliderView : UIView!{
        didSet{
            sliderView.backgroundColor = UIColor.white
            let maskPath = UIBezierPath(roundedRect: sliderView.bounds,
                                        byRoundingCorners: [.bottomRight, .topRight],
                                        cornerRadii: CGSize(width: 22, height: 22))
            
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            sliderView.layer.mask = shape
            let panGestureRec = UIPanGestureRecognizer(target: self, action: #selector(panView(sender:)))
            panGestureRec.delegate = self
            sliderView.addGestureRecognizer(panGestureRec)
            let tapGestureRec = UITapGestureRecognizer(target: self, action: #selector(tapOnSliderView))
            tapGestureRec.delegate = self
            sliderView.addGestureRecognizer(tapGestureRec)
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 0.5)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.5
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func tapOnSliderView(){
        
    }
    
    var startX : CGFloat = 0.0
    
    func panView(sender : UIPanGestureRecognizer){
        
        if sender.state == .began{
            startX = frame.origin.x
        }
        let currentSenderX = sender.translation(in: self.superview).x
        let newX = startX + currentSenderX
        let newpoint = CGPoint(x: min(max(newX, -containerView.frame.width), 0), y: 0)
        frame.origin = newpoint
        
        if sender.state == .ended || sender.state == .failed || sender.state == .cancelled{
            startX = 0.0
        }
    }
    
    var hidden 
    
    func toogleSideBar(on : Bool){
        //let duration = TimeInterval(0.3 * ((abs(frame.origin.x - containerView.frame.width) * 0.5) / (containerView.frame.width * 0.5)))
        UIView.animate(withDuration: 0.3, animations: { 
            self.frame.origin.x = on ? 0 : -self.containerView.frame.width
        }) { (fin) in
            
        }
    }
    
}


