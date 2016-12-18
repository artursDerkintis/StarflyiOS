//
//  SideBarCollectionViewCell.swift
//  Starfly
//
//  Created by Arturs Derkintis on 18/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import UIKit
import SnapKit

class SideBarCollectionViewCell: UICollectionViewCell {

    var tabViewModel : TabViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if let view = tabViewModel?.view{
            self.contentView.addSubview(view)
            view.snp.makeConstraints({ (make) in
                make.edges.equalTo(0)
            })
        }
        
    }

    var tabs : Tabs?{
        didSet{
            tabViewModel?.tabs = tabs
        }
    }
    
}
