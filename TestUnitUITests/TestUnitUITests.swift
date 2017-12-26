//
//  TestUnitUITests.swift
//  TestUnitUITests
//
//  Created by 郑小燕 on 2017/12/14.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import XCTest


class TestUnitUITests: XCTestCase {
    //XCUIApplication。这是你正在测试的应用的代理。它能让你启动应用，这样你就能执行测试了。它每次都会新起一个进程，这会多花一些时间，但是能保证测试应用时的状态是干净的，这样你需要处理的变量就少了些。
    //XCUIElement。这是你正在测试的应用中UI元素的代理。每个元素都有类型和标识符，结合二者就能找到应用中的UI元素。所有的元素都会嵌套在代表你的应用的树中
    //XCUIElementQuery。 当你想要找到某个元素时，就会用到 element query。每个 XCUIElement 里都包含一个query。这些query搜索 XCUIElement 树， 必须要找到一个匹配的。否则当你视图访问该元素时，测试就会失败。 例外是exists 属性，你可以使用这个属性来检查一个元素是否展示在树中。 这对于断言很有用。 更一般地你可以使用 XCUIElementQuery 来找到对accessibility可见的元素。Query会返回结果的集合。
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
    }
    
    func testAddition() {
        app.buttons["6"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        if let textFieldValue = app.textFields["display"].value as? String {

                                    XCTAssertTrue((textFieldValue == "8"), "Part 1 failed.")
        }
        
        
    }
    
}
