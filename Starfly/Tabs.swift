//
//  Tabs.swift
//  Starfly
//
//  Created by Arturs Derkintis on 17/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import Foundation


struct Tabs {
    
    var currentTabItem : TabsItem?{
        didSet{
            updateCurrentTabView?()
        }
    }
    var tabsItemArray : [TabsItem] = []
    
    var updateCurrentTabView : VoidClosure?
    
    mutating func addNewItem(tabsItem : TabsItem) {
        if let exsistingTabsItem = tabsItemArray.filter({ $0.ref == tabsItem.ref }).first{
            if let indexOfExistingTab = tabsItemArray.index(where: { $0.ref == (exsistingTabsItem.ref ?? "")}){
                tabsItemArray.remove(at: indexOfExistingTab)
                tabsItemArray.append(exsistingTabsItem)
            }
        }
        if let indexOfCurrentTab = tabsItemArray.index(where: { $0.ref == (currentTabItem?.ref ?? "")}){
            for _ in (indexOfCurrentTab + 1)..<tabsItemArray.count{
                tabsItemArray.removeLast()
            }
            print(indexOfCurrentTab)
        }
 
        currentTabItem = tabsItem
        tabsItemArray.append(tabsItem)
    }
    
    mutating func goBackToItem(ref : String){
        currentTabItem = tabsItemArray.filter({ $0.ref == ref }).first
    }
    
    mutating func goForwardToItem(ref : String){
        currentTabItem = tabsItemArray.filter({ $0.ref == ref }).first
    }
    
}
