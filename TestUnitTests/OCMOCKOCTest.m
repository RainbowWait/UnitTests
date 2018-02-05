//
//  OCMOCKOCTest.m
//  TestUnitTests
//
//  Created by 郑小燕 on 2018/1/26.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

@interface OCMOCKOCTest : XCTestCase

@end

@implementation OCMOCKOCTest

- (void)setUp {
    [super setUp];
    id mock = [OCMockObject mockForClass:[NSString class]];
//        OCMStubRecorder[([mock hasPrefix: @"hh"]).andReturn(@"YES");
//    [[[OCMStubRecorder alloc]initWithMockObject:mock] andReturn:@"YES"];
//    OCMClassMock
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
