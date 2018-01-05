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
    
    
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    
    @IBOutlet weak var fourBtn: UIButton!
    
    @IBOutlet weak var fiveBtn: UIButton!
    
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    
    @IBOutlet weak var pointBtn: UIButton!
    
    @IBOutlet weak var cleanBtn: UIButton!
    
    @IBOutlet weak var equalBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var subBtn: UIButton!
    
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBOutlet weak var devideBtn: UIButton!
    
    @IBOutlet weak var multiBtn: UIButton!
    var isLogin = false
    
    var calculator = Calculator()
    @IBOutlet weak var display: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.login()
    }
    func login() {
        isLogin = true
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

