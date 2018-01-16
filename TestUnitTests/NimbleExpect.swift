//
//  NimbleExpect.swift
//  TestUnitTests
//
//  Created by 郑小燕 on 2018/1/9.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import XCTest
import Quick
import Nimble
///XCTest assertions 相对于Nimbel的两个缺点
//1.没有一个简单地方法断言字符串包含一个特定的字符串，或者一个数字小于或等于另一个
//2.很难编写异步测试。


class NimbleExpect: XCTestCase {
    var mutableArray = [String]()
    
    var vc: ViewController!
    
    override func setUp() {
        self.vc = ViewController()
    }
    
    
    func testExample() {
        
        ///expect(...).to
        let a = 10
        expect(a).to(equal(10))
        
        ///expect(...).notTo 等同于expect(...).toNot
        expect(a).notTo(equal(11))
        expect(a).toNot(equal(11))
        
        ///custom Failure Message
        expect(a).to(equal(10), description: "a 等于 10")
        
        ///Nimble确保你不会比较两种不匹配的类型
        //Does not compile
        //expect(a).to(equal("hhhh"))
        
        ///Operator Overloads
        expect(a) > 9
        expect(a) == 10
        
        //Lazily Computed Values
        let exception = NSException(name: NSExceptionName.internalInconsistencyException, reason: "Not enough fish in the sea", userInfo: ["something": "is fishy"])
        expect { exception.raise() }.to(raiseException())
        //customize raiseException
        expect(exception.raise()).to(raiseException(named: NSExceptionName.internalInconsistencyException.rawValue))
        expect(exception.raise()).to(raiseException(named: NSExceptionName.internalInconsistencyException.rawValue, reason: "Not enough fish in the sea"))
        
        expect(exception.raise()).to(raiseException(named: NSExceptionName.internalInconsistencyException.rawValue, reason: "Not enough fish in the sea", userInfo: ["something": "is fishy"]))
        
        
        //C Primitives some testing frameworks make it hard to test primitive C values
        
        let actual: CInt = 1
        let expectedValue: CInt = 1
        expect(actual).to(equal(expectedValue))
        //Nime uses type inference
        expect(1 as CInt).to(equal(expectedValue))
        
        //Asynchronous Expectations
        DispatchQueue.main.async {
            self.mutableArray.append("dolphins")
            self.mutableArray.append("whales")
        }
        //        expect(self.mutableArray).toEventually(contain("dolphins", "whales"))
        //        expect(self.mutableArray).toNotEventually(contain("whales"))
        
        //Waits three seconds for mutableArray to contain "starfish"
        //        expect(self.mutableArray).toEventually(contain("starfish"), timeout: 3, description: "self.mutalbeArray not contains starfish")
        
        //You can also provide a callback by using the 'waitUntil'function:
        waitUntil { (done) in
            done()
        }
        
        //`waitUntil` also optionally takes a timeout parameter:
        waitUntil(timeout: 10) { (done) in
            done()
        }
        
        
        /*
         - `equal`
         - `beGreaterThan`
         - `beGreaterThanOrEqual`
         - `beLessThan`
         - `beLessThanOrEqual`
         - `beCloseTo`
         - `beTrue`
         - `beFalse`
         - `beTruthy`
         - `beFalsy`
         - `haveCount`
         */
        
        /// Built-in Matcher Functions
        //Type Checking
        expect(a).to(beAKindOf(Int.self))
        //Objects can be tested for their exact types using the `beAnInstanceOf` matcher:
        expect(a).to(beAnInstanceOf(Int.self))
        
        let model = BaseModel()
        model.message = "加载数据失败"
        model.state = 0
        
        let model1 = BaseModel()
        model1.message = "加载数据成功"
        model1.state = 1
        // Passes if 'model' has the same pointer address as 'expected':
        expect(model) === model1
        //或
        expect(model).to(beIdenticalTo(model1))
        
        expect(model) !== model1
        expect(model).toNot(beIdenticalTo(model1))
        
        //Comparisons
        
        let d = 10.0
        let e = 9.0
        let f = 11.0
        let g = 10.0001
        
        //less Than
        expect(d).to(beLessThan(f))
        expect(d) < f
        //less than or Equal
        expect(e).to(beLessThanOrEqualTo(f))
        expect(e) <= f
        //greater than
        expect(f).to(beGreaterThan(d))
        expect(f) > d
        //greater than or equal
        expect(f).to(beGreaterThanOrEqualTo(d))
        expect(f) >= d
        //beCloseTo
        expect(d).to(beCloseTo(e, within: 1))
        //≈
        expect(d) ≈ g
        expect(d) ≈ (e, 1)
        
        expect(d) ≈ f ± 1
        expect(d) == f ± 1
        
        expect([0.0, 2.0]) ≈ [0.00001, 2.000001]
        expect([0, 2]).to(beCloseTo([0.1, 2.1], within: 0.1))
        //Passes if 'd' is not nil, true , or an object with a boolean value of true
        expect(d).to(beTruthy())
        expect(d).to(beFalsy())
        
        let boolValue = false
        //Passes if 'boolValue' is only true (not nil or an object conforming to Boolean true)
        expect(boolValue).to(beTrue())
        expect(boolValue).to(beFalse())
        //Passes if 'd' is nil
        expect(d).to(beNil())
        ////Passes if 'd' is not nil
        expect(d).notTo(beNil())
        //// Passes if 'somethingThatThrows()' throws an assertion
        //模拟器
        #if false
            //Passes if 'somethingThatThrows()' throws an assertion
            expect { try self.somethingThatThrows()}.to(throwAssertion())
            expect { () -> Void in
                fatalError()
                }.to(throwAssertion())
            
            expect { throw NSError(domain: "test", code: 0, userInfo: nil)
                }.toNot(throwAssertion())
            
            var reachedPoint1 = false
            var reachedPoint2 = false
            expect {
                reachedPoint1 = true
                precondition(false, "condition message")
                reachedPoint2 = true
                }.to(throwAssertion())
            expect(reachedPoint1) == true
            expect(reachedPoint2) == false
            
        #endif
        
        //Passes if 'somethingThatThrows()' throws an 'Error':
        expect { try self.somethingThatThrows()
            }.to(throwError())
        //Passes if 'somethingThatThrows()' throws an error within a particular domain:
        //        expect {try self.somethingThatDomainThrows()
        //            }.to(throwError(closure: { (error: Error) in
        //                expect(error).to(equal(NSCocoaErrorDomain))
        //            }))
        //Passes if 'somethingThatThrows()' throws a particular error enum case:
        expect { try self.somethingThatThrows()
            }.to(throwError(ErrorReason.greaterThan))
        
        //Passes if 'somethingThatThrows()' throws an error of a particular type
        expect { try self.somethingThatTypeThrows()
            }.to(throwError(errorType: NSCocoaErrorType.self))
        
        ///Error
        let error: Error = ErrorReason.greaterThan
        
        //// Passes if 'error' represents any error value from the ErrorReason type:
        expect(error).to(matchError(ErrorReason.self))
        
        let actual1 = NimbleErrorEnum.timeout
       
       //Passes if 'actual1' represents the case 'timeout' from the NimbleErrorEnum type:
        expect(actual1).to(matchError(NimbleErrorEnum.timeout))
        
        //// Passes if 'actual1' contains an NSError equal to the one provided:
       
        let actual2 = NSError(domain: "err", code: 123, userInfo: nil)
        expect(actual2).to(matchError(NSError(domain: "err", code: 123, userInfo: nil)))
        let exception1 = NSException(name: NSExceptionName(rawValue: "ViewControllerMethod"), reason: "ViewController初始化错误", userInfo: nil)
        
        
        // Passes if 'actual', when evaluated, raises an exception:
        expect(exception1).to(raiseException())
        //Passes if 'actual' raises an exception with the given name:
        expect(exception1).to(raiseException(named:"ViewControllerMethod"))
       
       //Passes if 'actual' raises an exception which passes expectations defined in the given closure:
        // (in this case, if the exception's name begins with "a r")
       
         expect(exception1).to(raiseException(named: "ViewControllerMethod", reason: "ViewController初始化错误", userInfo: nil, closure: { (exception) in
//    expect(exception1.name).to(beginWith("Vi"))
        }))
        
    }
    
    //MARK: - Collection Membership
    func testCollectionMembership() {
        let actual = ["1", "2", "3"]
        // Passes if all of the expected values are members of '1':
        expect(actual).to(contain("1"))
        //`beginWith` and `endWith`
        expect(actual).to(beginWith("1"))
        expect(actual).to(endWith("3"))
        
        let turtles: [Turtle] = [Turtle(color: "blue"),Turtle(color: "green"), Turtle(color: "blue")]
        expect(turtles).to(containElementSatisfying({ (turtle) -> Bool in
            return turtle.color == "green"
        }))
        
        ///Strings
        let string = "How is it going"
        let match = "how is it going"
        
        expect(string).to(contain("is"))
        expect(string).to(beginWith("How"))
        expect(string).to(endWith("going"))
        expect(actual).to(beEmpty())
        
        ///Collection Elements
        expect([1, 2, 3, 4]).to(allPass({ $0! < 5
        }))
        ///Collection Count
        let array1 = [1, 2, 3]
        
        expect(array1).to(haveCount(3))
        expect(array1).notTo(haveCount(1))
    }
    
    //MARK: - Notifications
    func testNotifications() {
        let testNotification = Notification(name: Notification.Name(rawValue: "Foo"), object: nil, userInfo: nil)
        //// passes if the closure in expect { ... } posts a notification to a given
        expect {
            NotificationCenter.default.post(testNotification)
        }.to(postNotifications(equal([testNotification])))
        
        let notificationCenter = NotificationCenter()
        expect {
            notificationCenter.post(testNotification)
        }.to(postNotifications(equal([testNotification]),fromNotificationCenter: notificationCenter))
        
        
        
    }
    
    struct Turtle {
        var color: String = ""
        
    }
    class NSCocoaErrorType: Error {
        var domain: String = "报错啦"
        
    }
    
    enum ErrorReason: Error {
        case greaterThan
        case lessOrEqualThan
    }
    func somethingThatThrows() throws {
        let value = 10
        if value > 9 {
            throw ErrorReason.greaterThan
        }
        throw ErrorReason.lessOrEqualThan
    }
    
    func somethingThatTypeThrows() throws {
        let value = 10
        let error = NSCocoaErrorType()
        if value > 9 {
            error.domain = "大于9啦"
            throw  error
        }
        error.domain = "小于等于9啦"
        throw error
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    enum NimbleErrorEnum: Error {
        case timeout
        case others
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
