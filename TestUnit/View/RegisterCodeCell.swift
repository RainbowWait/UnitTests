//
//  RegisterCodeCell.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/28.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class RegisterCodeCell: UITableViewCell {

    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var codeBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getCodeAction(_ sender: UIButton) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
