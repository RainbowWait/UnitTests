//
//  ViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/14.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON
import CalculatorKit

class ViewController: UIViewController {

    var calculator = Calculator()
    @IBOutlet weak var display: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tap(_ sender: UIButton) {
        if let label = sender.titleLabel?.text {
            
            do {
                try calculator.input(label)
                display.text = calculator.displayValue
                print("text = \(label)")
            } catch let error {
                print("\(error.localizedDescription)")
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

