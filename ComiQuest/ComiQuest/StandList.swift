//
//  StandList.swift
//  ÷
//
//  Created by Mastere 1 IT on 23/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation

class StandList: NSObject {
    var standCollection = [Stand]()
    let stocker = NSUserDefaults.standardUserDefaults()
    
    required init(coder aDecoder: NSCoder) {
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(standCollection, forKey: "StandList")
    }
    func insertItems()
    {
        let stockerStand = NSKeyedArchiver.archivedDataWithRootObject(self.standCollection)
        NSUserDefaults.standardUserDefaults().setObject(stockerStand, forKey: "standList")
    }
    
    func retrieveItems()
    {
        if let stockerStand = NSUserDefaults.standardUserDefaults().objectForKey("standList") as? NSData {
            let savedStandList = NSKeyedUnarchiver.unarchiveObjectWithData(stockerStand) as! [Stand]
            self.standCollection = savedStandList
        }
    }
    func removeItem(value: Int){
        self.standCollection.removeAtIndex(value)
        let stockerStand = NSKeyedArchiver.archivedDataWithRootObject(self.standCollection)
        NSUserDefaults.standardUserDefaults().setObject(stockerStand, forKey: "standList")
    }

}
    