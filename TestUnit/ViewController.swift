//
//  ViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/14.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("https://www.cqcb.com/e/member/getuserfen.php",  method: .get).responseJSON { (response) in
            print(response)
            if response.error != nil {
//                expecta.fulfill()
//                XCTAssertNil(response.error, "请求出错")
            } else {
//                expecta.fulfill()
//                XCTAssertNil(response.result.error, "测试通过")
            }
        }
    }
    
    func recycle()  {
        for i in 1...100 {
            print(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

