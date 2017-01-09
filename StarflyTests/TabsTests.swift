//
//  TabsTests.swift
//  Starfly
//
//  Created by Arturs Derkintis on 17/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import XCTest
@testable import Starfly

class TabsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTabsHistoryWorkflow() {
        var tabs = Tabs()
        let tabsItem1 = TabsItem(ref: "ref1")
        tabs.addNewItem(tabsItem: tabsItem1)
        let tabsItem2 = TabsItem(ref: "ref2")
        tabs.addNewItem(tabsItem: tabsItem2)
        let tabsItem3 = TabsItem(ref: "ref3")
        tabs.addNewItem(tabsItem: tabsItem3)
        let tabsItem4 = TabsItem(ref: "ref4")
        tabs.addNewItem(tabsItem: tabsItem4)
        /// go back
        tabs.goBackToItem(ref: "ref2")
        XCTAssertEqual(tabs.currentTabItem?.ref, tabsItem2.ref)
        
        
        let tabsItem5 = TabsItem(ref: "ref5")
        tabs.addNewItem(tabsItem: tabsItem5)
        
        // shouldve deleted forward tabs once user navigate somewhere else
        XCTAssertEqual(tabs.tabsItemArray.count, 3)
        
        
        let tabsItem6 = TabsItem(ref: "ref6")
        tabs.addNewItem(tabsItem: tabsItem6)
        tabs.goBackToItem(ref: "ref2")
        tabs.addNewItem(tabsItem: tabsItem1)
        XCTAssertEqual(tabs.tabsItemArray.count, 2)
        
    }
    
    func testTabsAddRemoveSwap(){
        var tabsHandler = TabsHandler.shared
        let tabs1 = tabsHandler.addTab(ref: "tab1")
        let tabs2 = tabsHandler.addTab(ref: "tab2")
        let tabs3 = tabsHandler.addTab(ref: "tab3")
        tabsHandler.currentTabs = tabs1
        let tabs4 = tabsHandler.addTab(ref: "tab4")
        XCTAssertTrue(tabsHandler.currentIndex == 1)
        tabsHandler.removeTab(ref: "tab3")
        
        tabsHandler.swapTabs(ref1: "tab1", ref2: "tab2")
        XCTAssertTrue(tabsHandler.arrayOfTabs[0].ref == "tab2")
        
    }
    
}
