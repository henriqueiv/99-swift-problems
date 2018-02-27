//
//  ListTests.swift
//  swift99problemsTests
//
//  Created by Henrique Valcanaia on 21/02/18.
//  Copyright © 2018 Henrique Valcanaia. All rights reserved.
//

import XCTest
@testable import swift99problems

class ListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertNil(List<Any>())
        XCTAssertNotNil(List(1))
    }
    
    // p01
    func testLast() {
        XCTAssertTrue(List(1, 1, 2, 3, 5, 8)!.last! == 8)
    }
    
    // p02
    func testPennultimate() {
        XCTAssertTrue(List(1, 1, 2, 3, 5, 8)!.pennultimate! == 5)
    }
    
    // p03
    func testSubscript() {
        XCTAssertTrue(List(1, 1, 2, 3, 5, 8)![2]! == 2)
    }
    
    // p04
    func testLength() {
        XCTAssertTrue(List(1, 1, 2, 3, 5, 8)!.length == 6)
    }
    
    // p05
    func testReverse() {
        XCTAssertTrue(List(1,1,2,3,5,8)!.reverse() == List(8,5,3,2,1,1)!)
    }
    
    // p06
    func testPalindrome() {
        XCTAssertFalse(List(1,2,3)!.isPalindrome())
        XCTAssertTrue(List(1,2,3,2,1)!.isPalindrome())
    }
    
    // p07
    func testFlatten() {
        let list = List<Any>(List<Any>(1, 1)!, 2, List<Any>(3, List<Any>(5, 8)!)!)!
        let expectedList = List(1, 1, 2, 3, 5, 8)!
        let flatList = list.flatten()
        
        // Not able to compare List<Any>, comparing strings
        XCTAssertTrue(expectedList.description == flatList.description)
    }
    
    func testCompress() {
        let list = List<String>("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")!
        let compressed = list.compress()
        let expected = List("a", "b", "c", "a", "d", "e")!
        print(compressed.description)
        print(expected.description)
        XCTAssertTrue(compressed == expected)
    }
    
    func testPack() {
        let list = List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
        list.pack()
        List(List("a", "a", "a", "a"), List("b"), List("c", "c"), List("a", "a"), List("d"), List("e", "e", "e", "e"))

    }
    
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
