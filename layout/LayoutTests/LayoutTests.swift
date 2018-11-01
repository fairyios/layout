//
//  LayoutTests.swift
//  LayoutTests
//
//  Created by Fairy on 2018/11/1.
//  Copyright © 2018 fairyios. All rights reserved.
//

import XCTest
//@testable import Layout

class LayoutTests: XCTestCase {

    //var tableController: TableController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //let main = UIStoryboard(name: "Main", bundle: Bundle.main)
        //tableController = main.instantiateViewController(withIdentifier: "TableControllerStoryboardID") as! TableController
        
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSearchFilter() {
        print("搜索结果：")
        
        XCTAssert(1 == 2)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
