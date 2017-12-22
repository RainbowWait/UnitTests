//
//  ViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/14.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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

