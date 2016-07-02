//
//  Intervenant.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation

class Intervenant: NSObject {
    
    var name : String
    var firstName: String
    var age: String
    var photo: String
    var sexe: String
    var country: String
    
    init(nameValue: String, firstNameValue: String, countryValue: String, ageValue: String , photoValue: String, sexeValue: String){
        self.name = nameValue
        self.firstName = firstNameValue
        self.country = countryValue
        self.age = ageValue
        self.photo = photoValue
        self.sexe = sexeValue
    }
    init(coder decoder: NSCoder) {
        self.name = decoder.decodeObjectForKey("name") as! String
        self.firstName = decoder.decodeObjectForKey("firstName") as! String
        self.age = decoder.decodeObjectForKey("age") as! String
        self.photo = decoder.decodeObjectForKey("photo") as! String
        self.sexe = decoder.decodeObjectForKey("sexe") as! String
        self.country = decoder.decodeObjectForKey("country") as! String
        
    }

   
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.name, forKey: "name")
        coder.encodeObject(self.firstName, forKey: "firstName")
        coder.encodeObject(self.age, forKey: "age")
        coder.encodeObject(self.photo, forKey: "photo")
        coder.encodeObject(self.sexe, forKey: "sexe")
        coder.encodeObject(self.country, forKey: "country")
        
    }

    
}
