//
//  RegisterCell.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/28.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class RegisterCell: UITableViewCell {

    @IBOutlet weak var field: UITextField!
    var index: IndexPath? {
        didSet {
            if index?.row == 0 {
                field.placeholder = "请输入手机号码"
            } else if index?.row == 1 {
                field.placeholder = "请输入密码"
            } else if index?.row == 2 {
                field.placeholder = "请输入验证码"
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
