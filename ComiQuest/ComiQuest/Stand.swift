//
//  Stand.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation


class Stand:NSObject {
    var name: String
    var theme: String
    init(name: String, theme: String){
        self.name = name
        self.theme = theme
    }
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.theme = decoder.decodeObjectForKey("theme") as! String
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.theme, forKey: "theme")
    }
}
