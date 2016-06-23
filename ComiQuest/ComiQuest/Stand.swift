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
    
    init(name: String){
        self.name = name
    }
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
    }
}
