//
//  IntervenantList.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation
class IntervenantList {
    
    var intervenantCollection :[Intervenant] = []
    
    init(){
       
        
        let intervenant1 = Intervenant(nameValue: "Cranston", firstNameValue: "Bryan", countryValue: "USA", ageValue: 60, photoValue: "url-photo.png", sexeValue: "Homme")
        let intervenant2 = Intervenant(nameValue: "Paul", firstNameValue: "Aaron", countryValue: "USA", ageValue: 36, photoValue: "url-photo.png", sexeValue: "Homme")
        
        intervenantCollection.append(intervenant1)
        intervenantCollection.append(intervenant2)
        
    }
    func addIntervenant(value: Intervenant){
        self.intervenantCollection.append(value)
    }
    func isIntervenantAdded() -> Bool{
        let intervenantTest = Intervenant(
            nameValue: "test",
            firstNameValue: "test",
            countryValue: "test",
            ageValue: 10,
            photoValue: "url-photo.png ",
            sexeValue: "test"
        )
        self.addIntervenant(intervenantTest)
        if let tempNSArrayForChecking = self.intervenantCollection as NSArray? where tempNSArrayForChecking.containsObject(intervenantTest) {
            return true
        }
        else{
            return false
        }

    }
    func isIntervenantRemoved() -> Bool{
        let intervenantTest = Intervenant(
            nameValue: "test",
            firstNameValue: "test",
            countryValue: "test",
            ageValue: 10,
            photoValue: "url-photo.png",
            sexeValue: "test"
        )
        self.addIntervenant(intervenantTest)
        var i: Int = 0
        var checker: Bool = false
        for value in self.intervenantCollection{
            if(value === intervenantTest){
                intervenantCollection.removeAtIndex(i)
                checker = true
            }

            i++
        }
        return checker
        
    }
    
    
}
