//
//  UIColor+Extensions.swift
//  Starfly
//
//  Created by Arturs Derkintis on 17/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(hexString:String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner            = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    /// returns random color
    class var random : UIColor {
        get{
            let randomRed = CGFloat(drand48())
            
            let randomGreen = CGFloat(drand48())
            
            let randomBlue = CGFloat(drand48())
            
            return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
        set{
            
        }
    }
}
