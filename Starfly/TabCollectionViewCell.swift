//
//  TabView.swift
//  Starfly
//
//  Created by Arturs Derkintis on 18/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import UIKit


class TabCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    
    var tabsItem : TabsItem?{
        didSet{
            titleLabel.text = tabsItem?.title
        }
    }
    
}
