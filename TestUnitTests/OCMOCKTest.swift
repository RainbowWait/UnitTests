//
//  OCMOCKTest.swift
//  TestUnitTests
//
//  Created by 郑小燕 on 2018/1/24.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import XCTest
import OCMock



class OCMOCKTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let userDefault = OCMockObject.expect(LoginViewController.self)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMockingAnObject() {
        var mock = OCMockObject.mock(for: ServerConnection.self)
        
    }
    
    class ServerConnection: NSObject {
        func fetchData() -> String {
            return "real data returned from other system"
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
