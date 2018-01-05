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
import Quick
import Nimble


class TestUnitTests: XCTestCase {
//    var VC: ViewController!
    
    override func setUp() {
        super.setUp()
        //初始化的代码，在测试方法调用之前调用
//        VC = ViewController()
    }
    
    override func tearDown() {
        // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
        super.tearDown()
    }
    
    func testExample() {
        // 测试用例的例子，注意测试用例一定要test开头
//        let mock = OCMCla
        
        
    }
    
    

    
    
    func testAlamofire() {
        //XCTestExpectation 对于异步测试的支持，借助 XCTestExpectation 类来实现。现在，测试能够为了确定的合适的条件等待一个指定时间长度，而不需要求助于GCD
//        XCTestExpectation
        let expecta = expectation(description: "本次测试描述")
        let timeout: TimeInterval = 15
        
        //https://www.cqcb.com/newlist42.html
        Alamofire.request("https://www.cqcb.com/e/member/getuserfen.php",  method: .get).responseJSON { (response) in
            print(response.result)
            if response.error != nil {
                //在异步方法被测试的相关的回调中实现期望值
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
           self.recycle()
        }
    }
    
    func recycle()  {
        for i in 1...100 {
            print(i)
        }
    }
}

class LoginViewControllerSpec: QuickSpec {
    override func spec() {
        var login: LoginViewController!
        beforeEach {
            login = LoginViewController()
        }
        describe(".viewDidLoad") {
            beforeEach {
                //访问视图来触发LoginViewController.viewDidLoad
                let _ = login.view
            }
            it("set navigationController title 登录", closure: {
                expect(login.title).to(equal("登录"))
            })
        }
        
                    describe("the view") {
                        beforeEach {
                            //触发.viewDidLoad(), .viewWillAppear(), and .viewDidAppear() 事件
                            login.beginAppearanceTransition(true, animated: false)
                            login.endAppearanceTransition()
                        }
                    }
        
                    describe(".viewWillDisappear()") {
                        beforeEach {
                            //直接调用生命周期事件
                            login.viewWillDisappear(false)
                        }
                    }
        
    }
}

class ViewControllerSpec: QuickSpec {
    var vc: ViewController!
    override func spec() {
        beforeEach {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            self.vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
            
        }
        
        describe(".viewDidLoad") {
            beforeEach {
                //访问视图来触发LoginViewController.viewDidLoad
                let _ = self.vc.view
            }
            it("set navigationController title 登录", closure: {
                expect(self.vc.isLogin).to(equal(true))
            })
        }
        
//        describe("tap action") {
//            it("print caculator number", closure: {
//
//                self.vc.oneBtn.sendActions(for: .touchUpInside)
//                self.vc.twoBtn.sendActions(for: .touchUpInside)
//                self.vc.addBtn.sendActions(for: .touchUpInside)
//                self.vc.fiveBtn.sendActions(for: .touchUpInside)
//                self.vc.equalBtn.sendActions(for: .touchUpInside)
//                expect(self.vc.display.text).to(equal("1"))

//            })
//        }
//
        describe("viewWillDisappear") {
            beforeEach {
            self.vc.viewWillDisappear(true)
            }
        }
        
    }
}



