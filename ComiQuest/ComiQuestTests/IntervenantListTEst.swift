//
//  IntervenantListTEst.swift
//  ComiQuest
//
//  Created by Mastere 1 IT on 24/06/2016.
//  Copyright © 2016 mkdir. All rights reserved.
//

import XCTest

class IntervenantListTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    func test_add_to_list(){
        let intervenantStore = IntervenantList()
        XCTAssert(intervenantStore.isIntervenantAdded())
    }
    func test_remove_from_list(){
        let intervenantStore = IntervenantList()
        XCTAssert(intervenantStore.isIntervenantRemoved())
    }

}
