//
//  DataProviderProtocol.swift
//  TestUnit
//
//  Created by 郑小燕 on 2018/1/5.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON
///使用模拟对象进行测试

public protocol DataProviderProtocol {
    func fetch(callback: @escaping(_ data: String) -> Void)
}
class DataProvider: NSObject, DataProviderProtocol {
    func fetch(callback: @escaping (String) -> Void) {
        Alamofire.request("https://www.cqcb.com/e/member/getuserfen.php",  method: .get).responseJSON { (response) in
            
            if response.error != nil {
            } else {
                let result = response.result.value as! NSDictionary
                let base = BaseModel.deserialize(from: result)
                callback(base?.message ?? "哈哈哈")
            }
        }
    }
}

class MockDataProvider: NSObject, DataProviderProtocol {
    var fetchCalled = false
    func fetch(callback: @escaping (String) -> Void) {
        fetchCalled = true
        callback("测试完成")
    }
    
}


