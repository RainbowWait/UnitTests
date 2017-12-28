//
//  TestUnitTests.swift
//  TestUnitTests
//
//  Created by 郑小燕 on 2017/12/14.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import Foundation
import XCTest
import Alamofire
import HandyJSON


class TestUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        //初始化的代码，在测试方法调用之前调用
    }
    override static func setUp() {
        
    }
    
    override func tearDown() {
        // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
        super.tearDown()
    }
    
    func testExample() {
        // 测试用例的例子，注意测试用例一定要test开头
        
    }
    
    func testAlamofire() {
        let expecta = expectation(description: "本次测试描述")
        let timeout: TimeInterval = 15
        
        //https://www.cqcb.com/newlist42.html
        Alamofire.request("https://www.cqcb.com/e/member/getuserfen.php",  method: .get).responseJSON { (response) in
            print(response.result)
            if response.error != nil {
               expecta.fulfill()
               XCTAssertNil(response.error, "请求出错")
            } else {
                let result = response.result as? String
                
                let base = BaseModel.deserialize(from: result)
//                XCTAssertTrue(base?.state == 0, "成功")
                
              expecta.fulfill()
            XCTAssertNil(response.result.error, "测试通过")
            }
        }
        //如果时间超过timeout回调还没有执行，就会测试失败，hander会在超时后调用
       waitForExpectations(timeout: timeout, handler: nil)
    }
    
    
    func testPerformanceExample() {
        // 测试性能例子
        self.measure {
            // 需要测试性能的代码
        }
    }
    
}
