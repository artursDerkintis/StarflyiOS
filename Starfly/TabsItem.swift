//
//  TabItem.swift
//  Starfly
//
//  Created by Arturs Derkintis on 17/12/2016.
//  Copyright © 2016 Arturs Derkintis. All rights reserved.
//

import Foundation

struct TabsItem {
    var title : String?
    var urlString : String?
    var progress : Float?
    var ref : String?
    
    init(ref : String){
        self.title = ""
        self.urlString = ""
        self.progress = 1.0
        self.ref = ref
    }
    
}
