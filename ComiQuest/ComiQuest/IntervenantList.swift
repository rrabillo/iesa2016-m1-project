//
//  IntervenantList.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation
class IntervenantList: NSObject {
    
    var intervenantCollection :[Intervenant] = []
    let stocker = NSUserDefaults.standardUserDefaults()

    
    required init(coder aDecoder: NSCoder) {
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(intervenantCollection, forKey: "IntervenantList")
    }
    func insertItems()
    {
        let stockerIntervenant = NSKeyedArchiver.archivedDataWithRootObject(self.intervenantCollection)
        NSUserDefaults.standardUserDefaults().setObject(stockerIntervenant, forKey: "IntervenantList")
    }
    
    func retrieveItems()
    {
        if let stockerIntervenant = NSUserDefaults.standardUserDefaults().objectForKey("IntervenantList") as? NSData {
            let savedIntervenantList = NSKeyedUnarchiver.unarchiveObjectWithData(stockerIntervenant) as! [Intervenant]
            self.intervenantCollection = savedIntervenantList
        }
    }
    func removeItem(value: Int){
        self.intervenantCollection.removeAtIndex(value)
        let stockerIntervenant = NSKeyedArchiver.archivedDataWithRootObject(self.intervenantCollection)
        NSUserDefaults.standardUserDefaults().setObject(stockerIntervenant, forKey: "IntervenantList")
    }

    //
    
    func addIntervenant(value: Intervenant){
        self.intervenantCollection.append(value)
    }

    func removeIntervenant(valueIntervenant: Intervenant){
        var i: Int = 0
        for value in self.intervenantCollection{
            if(value === valueIntervenant){
                intervenantCollection.removeAtIndex(i)
            }
            i++
        }
        
    }
    
    
}
