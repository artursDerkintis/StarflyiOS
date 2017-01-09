//
//  SideTabBarViewController.swift
//  Starfly
//
//  Created by Arturs Derkintis on 15/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import UIKit

class SideTabBarViewController: UIViewController {
    let sideTabID = "sideTabID"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension SideTabBarViewController : UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sideTabID, for: indexPath) as? SideBarCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    
}
