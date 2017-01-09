//
//  TabsHandler.swift
//  Starfly
//
//  Created by Arturs Derkintis on 18/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import Foundation


struct TabsHandler {
    
    static let shared = TabsHandler()
    
    var shouldUpdateTabsCollectionView : VoidClosure?
    var arrayOfTabs : [Tabs] = []
    var currentTabs : Tabs?

    mutating func addTab(ref : String) -> Tabs{
        var tabs = Tabs()
        tabs.ref = ref
        if let currentIndex = currentIndex{
            arrayOfTabs.insert(tabs, at: currentIndex + 1)
        }else{
            arrayOfTabs.append(tabs)
        }
        currentTabs = tabs
        shouldUpdateTabsCollectionView?()
        return tabs
    }
    
    var currentIndex : Int?{
        return arrayOfTabs.index(where: { $0.ref == currentTabs?.ref})
    }
    
    mutating func removeTab(ref : String){
        if let index = arrayOfTabs.index(where: { $0.ref == ref }){
            arrayOfTabs.remove(at: index)
        }
        
    }
    
    mutating func swapTabs(ref1 : String, ref2 : String){
        if let index1 = arrayOfTabs.index(where: { $0.ref == ref1 }), let index2 = arrayOfTabs.index(where: { $0.ref == ref2 }){
            swap(&arrayOfTabs[index1], &arrayOfTabs[index2])
        }
    }
    
}
