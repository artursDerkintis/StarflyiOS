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
    
    func testTabsWorkflow() {
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
    
    
}
