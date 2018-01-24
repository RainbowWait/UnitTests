//
//  OHHTTPStubsTest.swift
//  TestUnitTests
//
//  Created by 郑小燕 on 2018/1/24.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import XCTest

class OHHTTPStubsTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func testOHHTTPStubs() {
        stub(condition: isHost("mywebservice.com")) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            let stubPath = OHPathForFile("wsresponse.json", type(of: self))
            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
        }
        stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let stubData = "Hello World".data(using: String.Encoding.utf8)
            return OHHTTPStubsResponse(data: stubData!, statusCode: 200, headers: nil)
        }
        
        //Stub requests with a file
        stub(condition: isHost("mywebservice.com")) { (request) -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(fileAtPath: OHPathForFile("wsresponse.json", type(of: self))!, statusCode: 200, headers: ["Content-Type": "application/json"])
        }
        
        stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let obj = ["key1": "value1", "key2": ["value2A", "value2B"]] as [String : Any]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        //模拟网络不好的状态
        stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let someDict = ["key1": 1, "key2": 2]
            
        return OHHTTPStubsResponse(jsonObject: someDict, statusCode: 200, headers: nil).requestTime(1.0, responseTime: 3.0)
        }
        //specify a network speed instead of responseTime
        /*
         OHHTTPStubsDownloadSpeedGPRS   =    -7 =    7 KB/s =    56 kbps
         OHHTTPStubsDownloadSpeedEDGE   =   -16 =   16 KB/s =   128 kbps
         OHHTTPStubsDownloadSpeed3G     =  -400 =  400 KB/s =  3200 kbps
         OHHTTPStubsDownloadSpeed3GPlus =  -900 =  900 KB/s =  7200 kbps
         OHHTTPStubsDownloadSpeedWifi   = -1500 = 1500 KB/s = 12000 kbps
         */
        stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let someDict = ["key1": 1, "key2": 2]
            
            return OHHTTPStubsResponse(jsonObject: someDict, statusCode: 200, headers: nil).responseTime(OHHTTPStubsDownloadSpeed3G)
        }
        
        stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let someDict = ["key1": 1, "key2": 2]
            let notConnectedError = NSError(domain: NSURLErrorDomain, code: URLError.notConnectedToInternet.rawValue, userInfo: nil)
            return OHHTTPStubsResponse(error: notConnectedError)
        }
        //Advanced Usage
        var callCounter = 0
        stub(condition: isHost("mywebservice.com")) {_ in
            callCounter += 1
            if callCounter <= 2 {
                let notConnectedError = NSError(domain:NSURLErrorDomain, code:Int(CFNetworkErrors.cfurlErrorNotConnectedToInternet.rawValue), userInfo:nil)
                return OHHTTPStubsResponse(error:notConnectedError)
            } else {
                let stubData = "Hello World!".data(using: String.Encoding.utf8)
                return OHHTTPStubsResponse(data: stubData!, statusCode:200, headers:nil)
            }
        }
        //Name your stubs and log their activation
       /* weak var stub1 = */stub(condition: isHost("mywebservice.com")) { (_) -> OHHTTPStubsResponse in
            let someDict = ["key1": 1, "key2": 2]
            
            return OHHTTPStubsResponse(jsonObject: someDict, statusCode: 200, headers: nil).requestTime(1.0, responseTime: 3.0)
        }.name = "stub request time"
        //stub1?.name = "stub request time"
        OHHTTPStubs.onStubActivation() { request, stub, respone in
            let str = stub.name as! String
            print("stubbed by \(str)")
        }
       
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
