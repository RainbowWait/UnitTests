//
//  SecondViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/27.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneField.delegate = self
        passwordField.delegate = self
//        passwordField.keyboardType = .decimalPad
//        passwordField.keyboardType = .decimalPad
        self.title = "登录"
    }
    
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == phoneField {
            textField.resignFirstResponder()
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            textField.resignFirstResponder()
            self.navigationController?.popViewController(animated: true)
        }
        return true
    }

    @IBAction func LoginAction(_ sender: Any) {
       print("登录成功")
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
//        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    
    @IBAction func forgetAction(_ sender: UIButton) {
//        self.navigationController?.pushViewController(ForgetPasswordViewController(), animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
