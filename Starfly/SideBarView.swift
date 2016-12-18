//
//  SideBarView.swift
//  Starfly
//
//  Created by Arturs Derkintis on 15/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import UIKit
import SnapKit

class SideBarView: UIView {
    @IBOutlet weak var containerView : UIView!
    @IBOutlet weak var sliderView : UIView!{
        didSet{
            sliderView.backgroundColor = UIColor(hexString: "#cbdc9b")
            let maskPath = UIBezierPath(roundedRect: sliderView.bounds,
                                        byRoundingCorners: [.bottomRight, .topRight],
                                        cornerRadii: CGSize(width: 22, height: 22))
            
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            sliderView.layer.mask = shape
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
