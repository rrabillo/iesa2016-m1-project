//
//  Intervenant.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 22/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import Foundation

class Intervenant {    
    
    var name : String?  {
        get {
            return self.name
        }
        set(nameValue) {
            self.name = nameValue
        }
    }
    
    var firstName : String? {
        get {
            return self.firstName
        }
        set(firstNameValue) {
            self.firstName = firstNameValue
        }
    }
    
    var county : String? {
        get {
            return self.county
        }
        set(countryValue) {
            self.county = countryValue
        }
    }
    
    var age : Int? {
        get {
            return self.age
        }
        set(ageValue) {
            self.age = ageValue
        }
    }
    
    var photo : String? {
        get {
            return self.photo
        }
        set(photoValue){
            self.photo = photoValue
        }
    }
    
    var sexe : String? {
        get {
            return self.sexe
        }
        set(sexeValue) {
            self.sexe = sexeValue
        }
    }
    
    init(nameValue: String, firstNameValue: String, countryValue: String, ageValue: Int , photoValue: String, sexeValue: String){
        self.name = nameValue
        self.firstName = firstNameValue
        self.county = countryValue
        self.age = ageValue
        self.photo = photoValue
        self.sexe = sexeValue
    }
    
}