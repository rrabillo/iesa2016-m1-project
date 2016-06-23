//
//  StandList.swift
//  ComiQuest
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
    //    func insertNewStand(title: String){
    //        let stand = Stand(coder: NSCoder())
    //        stand.setterName(title)
    //        standCollection.append(stand)
    //    }
    
//    func saveStands(){
//        let standsData = NSKeyedArchiver.archivedDataWithRootObject(self.standCollection)
//        NSUserDefaults.standardUserDefaults().setObject(standsData, forKey: "Stands")
//    }
//    
//    func loadStands(){
//        let standsData = NSUserDefaults.standardUserDefaults().objectForKey("Stands") as? NSData
//        if let standsData = standsData {
//            let standsArray = NSKeyedUnarchiver.unarchiveObjectWithData(standsData) as? [Stand]
//            
//            if let standsArray = standsArray {
//                print(standsArray)
//            }
//            
//        }
//    }
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

}
    