//
//  TabViewModel.swift
//  Starfly
//
//  Created by Arturs Derkintis on 17/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import Foundation
import UIKit


class TabViewModel : NSObject, UICollectionViewDelegate{
    
    let cellID = "tabViewModel"
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    

    lazy var view : UIView? = {
        let view = UINib(nibName: "SideTab", bundle: Bundle.main).instantiate(withOwner: self, options: nil)[0] as? UIView
        self.setup()
        return view
    }()
    
    func setup() {
        collectionView.register(UINib(nibName: "TabCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: cellID)
    }
    
    var tabs : Tabs? {
        didSet{
            
        }
    }
    
}

extension TabViewModel: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellID, for: indexPath) as? TabCollectionViewCell else{
            return UICollectionViewCell()
        }
        if let tabsItem = tabs?.tabsItemArray[indexPath.row]{

        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs?.tabsItemArray.count ?? 0
    }
}
