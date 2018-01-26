//
//  SecondViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/27.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var forgetPwdBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    var isLogin = false
    var textStub: OHHTTPStubsDescriptor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneField.delegate = self
        passwordField.delegate = self
//        passwordField.keyboardType = .decimalPad
//        passwordField.keyboardType = .decimalPad
        self.title = "登录"
        self.OHHTTPStubsTest()
        
    }
    
    func OHHTTPStubsTest() {
       textStub = stub(condition: isHost("www.opensource.apple.com") && isExtension("txt")) { (_) -> OHHTTPStubsResponse in
            return fixture(filePath: OHPathForFile("stub.txt", type(of: self))!, headers: ["Content-Type": "text/plain"]).requestTime(1.0, responseTime: OHHTTPStubsDownloadSpeed3G)
        }
        textStub.name = "text stub"
    }
    func request() {
        if !isLogin {
            let urlString = "http://www.opensource.apple.com/source/Git/Git-26/src/git-htmldocs/git-commit.txt?txt"
            Alamofire.request(urlString, method: .get).responseJSON { (response) in
                if let receivedData = response.data, let receivedText = NSString(data: receivedData, encoding: String.Encoding.ascii.rawValue) {
                    print("result.data = \(receivedText)")
                    self.isLogin = true
                }
            }
        } else {
            self.isLogin = false
            OHHTTPStubs.removeStub(textStub)
        }
        
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
        self.request()
//        self.isLogin = true
//        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    
    @IBAction func forgetAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(ForgetPasswordViewController(), animated: true)
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
