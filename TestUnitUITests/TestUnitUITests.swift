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

    
    func testLogin() {
        #if false
        self.tabBar()
        self.loginAction()
        self.loginTest()
        self.loginAction()
        #endif
        

    }
    
    
    func HHH() {
        #if false
        let app2 = app
        app.tabBars.buttons["Favorites"].tap()
        
        let button = app.buttons["登录"]
        button.tap()
        
        let textField = app.textFields["请输入手机号码"]
        textField.tap()
        
       
        shiftButton.tap()
        shiftButton.tap()
        shiftButton.tap()
        shiftButton.tap()
        shiftButton.tap()
        
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        moreKey.tap()
        textField.typeText("$")
        
        let moreKey2 = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, letters\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey2.tap()
        moreKey2.tap()
        

        nextKeyboardButton.tap()
        nextKeyboardButton.tap()
        nextKeyboardButton.tap()
        nextKeyboardButton.tap()
        nextKeyboardButton.tap()
        
        app2/*@START_MENU_TOKEN@*/.buttons["dictation"]/*[[".keyboards",".buttons[\"Dictate\"]",".buttons[\"dictation\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["启用听写？"].buttons["以后"].tap()
        textField.typeText(" ")
        
        let returnButton = app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        app.secureTextFields["请输入密码"].typeText("\n")
        
        let deleteKey = app2/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        returnButton.tap()
        app.typeText("\n")
        button.tap()
        textField.tap()
        app.buttons["注册"].tap()
        
        let tablesQuery = app2.tables
        let textField2 = tablesQuery/*@START_MENU_TOKEN@*/.textFields["请输入手机号码"]/*[[".cells.textFields[\"请输入手机号码\"]",".textFields[\"请输入手机号码\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        textField2.tap()
        
        let clearTextTextField = tablesQuery/*@START_MENU_TOKEN@*/.textFields.containing(.button, identifier:"Clear text").element/*[[".cells.textFields.containing(.button, identifier:\"Clear text\").element",".textFields.containing(.button, identifier:\"Clear text\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        clearTextTextField.typeText("☻☻☻")
        clearTextTextField.tap()
        textField2.tap()
        clearTextTextField.typeText("          ")
        
        let deleteKey2 = app2/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards",".keys[\"删除\"]",".keys[\"delete\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        deleteKey2.tap()
        clearTextTextField.typeText("☻")
        deleteKey2.tap()
        
        let returnButton2 = app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"换行\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton2.tap()
        textField2.typeText("\n")
        returnButton2.tap()
        textField2.typeText("\n")
        returnButton2.tap()
        textField2.typeText("\n")
        nextKeyboardButton.tap()
        shiftButton.tap()
        nextKeyboardButton.tap()
        
        let key = app.keys["符号面板"]
        key.tap()
        key.tap()
        
        let key2 = app.keys["返回"]
        key2.tap()
        key2.tap()
        key.tap()
        key.tap()
        key2.tap()
        key2.tap()
        key.tap()
        key.tap()
        key2.tap()
        key2.tap()
        key.tap()
        key.tap()
        key2.tap()
        key2.tap()
        
        let key3 = app.keys["语音输入"]
        key3.tap()
        key3.tap()
        app.buttons["取消"].tap()
        key3.tap()
        key3.tap()
        
        let element = app.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1)
        element.tap()
        element.tap()
        app.buttons["切换输入方式"].tap()
        app.buttons["设置输入法"].tap()

        #endif
    }
    
    
    func testRegister() {
        #if true
                self.tabBar()
                self.loginAction()
                app.buttons["注册"].tap()
        let phoneField = app.tables.textFields["请输入手机号码"]
        phoneField.tap()
        
        //更换数字键盘
//        let numberPlaneKey = app/*@START_MENU_TOKEN@*/.keys["Number-Plane"]/*[[".keyboards.keys[\"Number-Plane\"]",".keys[\"Number-Plane\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            let numberPlaneKey = app.keys["数字键盘"]
        numberPlaneKey.tap()
        app.keys["1"].tap()
        app.keys["8"].tap()
        app.keys["2"].tap()
        app.keys["3"].tap()
//        phoneField.typeText("1823")
    
        //键盘删除键
//        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards",".keys[\"删除\"]",".keys[\"delete\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
            let deleteKey = app.keys["删除"]
        deleteKey.tap()
        //app.keys 和 phoneField.typeText不能同时使用
//        phoneField.typeText("3142245")
        app.keys["2"].tap()
        app.keys["3"].tap()
        app.keys["1"].tap()
        app.keys["4"].tap()
        app.keys["2"].tap()
        app.keys["2"].tap()
        app.keys["4"].tap()
        app.keys["5"].tap()
        let passwordField = app.tables.textFields["请输入密码"]
        passwordField.tap()
//        numberPlaneKey.tap()
        passwordField.typeText("111111")
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        passwordField.typeText("222222")
        
        let button = app.tables/*@START_MENU_TOKEN@*/.buttons["获取验证码"]/*[[".cells.buttons[\"获取验证码\"]",".buttons[\"获取验证码\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        let codeField = app.tables.textFields["验证码"]
        codeField.tap()
//        numberPlaneKey.tap()
        codeField.typeText("867466")
        
        app.tables.buttons["注册"].tap()
        
        #endif
        
    }
    
    
    
    
    func tabBar() {
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Favorites"].tap()
    }
    
    func loginAction() {
        let loginBtn = app.buttons["登录"]
        loginBtn.tap()
    }
    
    func loginTest() {
        let textField = app.textFields["请输入手机号码"]
        textField.tap()
        #if false
            //切换大小写
             let shiftButton = app/*@START_MENU_TOKEN@*/.buttons["shift"]/*[[".keyboards.buttons[\"shift\"]",".buttons[\"shift\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            shiftButton.tap()
            shiftButton.tap()
            
            //切换键盘，键盘样式切换
                    let nextKeyboardButton = app/*@START_MENU_TOKEN@*/.buttons["Next keyboard"]/*[[".keyboards.buttons[\"Next keyboard\"]",".buttons[\"Next keyboard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            nextKeyboardButton.tap()
            #endif
        //键盘切换输入法
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        textField.typeText("18223142245")
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        
        let secureTextField = app.secureTextFields["请输入密码"]
        secureTextField.tap()
        moreKey.tap()
        secureTextField.typeText("111111")
        //清除
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        deleteKey.tap()
        secureTextField.typeText("2222222")
        returnButton.tap()
        
//        app.buttons["完成"].tap()
    }
    
    func testAddition() {
//        app.buttons["6"].tap()
//        app.buttons["+"].tap()
//        app.buttons["2"].tap()
//        app.buttons["="].tap()
//        if let textFieldValue = app.textFields["display"].value as? String {
//
//                                    XCTAssertTrue((textFieldValue == "8"), "Part 1 failed.")
//        }
//
//
    }
    
}
