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
    
}