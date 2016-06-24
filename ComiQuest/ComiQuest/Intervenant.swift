//
//  Intervenant.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation

class Intervenant {    
    
    var name : String
    var firstName: String
    var age: Int
    var photo: String
    var sexe: String
    var country: String
  
    init(nameValue: String, firstNameValue: String, countryValue: String, ageValue: Int , photoValue: String, sexeValue: String){
        self.name = nameValue
        self.firstName = firstNameValue
        self.country = countryValue
        self.age = ageValue
        self.photo = photoValue
        self.sexe = sexeValue
    }
    
}