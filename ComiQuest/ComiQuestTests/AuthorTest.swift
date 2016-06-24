//
//  AuthorTest.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import XCTest

class AuthorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func test_name_notBlank() {
        
         let author = Author()
        author.name = "Sartre"
        
        XCTAssertEqual("Sartre", author.name)
        
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func test_name_nil(){
        
    }
    
    func test_name_is_Sartre(){
        let author = Author()
        
        author.name = "Sartre"
        
        XCTAssert(author.isSartre())
        
    }
}

//je veux une méthode dans Author qui s'appelle isNameSartre, qui me retourne true, si le name est égal à Sartre.