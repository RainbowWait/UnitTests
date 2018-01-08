//
//  SecondViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/27.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var dataProvider: DataProviderProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        dataProvider = dataProvider ?? DataProvider()
        dataProvider?.fetch(callback: { (data) -> Void in
//            self.resultLabel.text = data
            print("data = \(data)")
        })
    }

    @IBAction func LoginAction(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
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
