//
//  ShowTaskViewControllerTests.swift
//  taskAppTests
//
//  Created by SCMACEXT-08 on 11/11/18.
//  Copyright © 2018 SCMACEXT-00. All rights reserved.
//

import XCTest
@testable import taskApp

class ShowTaskViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    func test_StringCharacterInput(){
        let task = ShowTaskViewController()
       // let plaintext = "input 123 &*@"
        task.userInput.text = "input 123 &*@"
        
        XCTAssertEqual("input 123 &*@", task.userInput.text)
        //unexpectedly got nil yet have guard statement on userInput
        
    }
    
    func test_StringCharacterInput2(){
        _ = ShowTaskViewController()
        let plaintext = "Not Sure what else to test"
        
        
        XCTAssertEqual("Not Sure what else to test", plaintext)
        
    }
    
    func test_trySwitchingSwitchStatus(){
        let task = ShowTaskViewController()
        let mySwitch1 = task.mySwitch.isOn
    }
    
    func test_CheckingIfFalse(){
//        if let argument = firstArgumentInClosure{
//            XCTAssert(argument)
//        }
        
        
    }
    
    
}
