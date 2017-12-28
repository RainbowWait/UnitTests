//
//  UnitConversionsTests.swift
//  TestUnitTests
//
//  Created by 郑小燕 on 2017/12/25.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import XCTest
import CalculatorKit

class UnitConversionsTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
        XCTAssertNotNil(self.calculator, "Cannot create Calculator instance.")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
    func testAddition() {
        if let calculator = calculator {
            try? calculator.input("6")
            try? calculator.input("+")
            try? calculator.input("2")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "8", "计算错误")
        }
    }
    
    func testSubtraction() {
        if let calculator = calculator {
            try? calculator.input("1")
            try? calculator.input("9")
            try? calculator.input("-")
            try? calculator.input("2")
             try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "17", "计算错误")
        }
    }
    
    func testDivision() {
        if let calculator = calculator {
            
            try? calculator.input("1")
            try? calculator.input("9")
            try? calculator.input("/")
            try? calculator.input("8")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "2.375")
        }
    }
    
    func testMultiplication() {
        if let calculator = calculator {
            
            try? calculator.input("6")
            try? calculator.input("*")
            try? calculator.input("2")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "12")
        }
    }
    
    func testSubtractionNegativeResult() {
        if let calculator = calculator {
            
            try? calculator.input("6")
            try? calculator.input("-")
            try? calculator.input("2")
            try? calculator.input("4")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "-18")
        }
    }
    
    func testClearLastEntry() {
        if let calculator = calculator {
            
            try? calculator.input("7")
            try? calculator.input("+")
            try? calculator.input("3")
            try? calculator.input("C")
            try? calculator.input("4")
            try? calculator.input("=")
            XCTAssertTrue(calculator.displayValue == "11")
        }
    }
    
    func testClearComputation() {
        if let calculator = calculator {
            
            try? calculator.input("C")
            try? calculator.input("7")
            try? calculator.input("+")
            try? calculator.input("3")
            try? calculator.input("C")
            try? calculator.input("C")
            XCTAssertTrue(calculator.displayValue == "0")
        }
    }
    
    func testInputException() {
        if let calculator = calculator {
            XCTAssertThrowsError(try calculator.input("67"), "67输入错误", { (error) in
                print(error.localizedDescription)
            })
            
            XCTAssertThrowsError(try calculator.input("j"), "j输入错误", { (error) in
                print(error.localizedDescription)
            })
            
            XCTAssertThrowsError(try calculator.input(nil), "不能输入空", { (error) in
                print(error.localizedDescription)
            })
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
