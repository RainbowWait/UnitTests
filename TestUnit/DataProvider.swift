//
//  DataProviderProtocol.swift
//  TestUnit
//
//  Created by 郑小燕 on 2018/1/5.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import Foundation
import Alamofire

protocol DataProviderProtocol: NSObjectProtocol {
    func fetch(callback: (_ data: String) -> Void)
}

class DataProvider: NSObject, DataProviderProtocol {
    func fetch(callback: (String) -> Void) {
        Alamofire.request("https://www.cqcb.com/e/member/getuserfen.php",  method: .get).responseJSON { (response) in
            
        }
    }
}


