//
//  FooterVier.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/28.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

class FooterVier: UITableViewHeaderFooterView {
    var registerBtn: UIButton!
    var viewController: UIViewController!
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.registerBtn = UIButton(type: .custom)
        self.registerBtn.backgroundColor = UIColor.red
        self.registerBtn.setTitleColor(UIColor.white, for: .normal)
        self.registerBtn.setTitle("注册", for: .normal)
        self.contentView.addSubview(registerBtn)
        self.registerBtn.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
    }
    @objc func registerAction() {
        viewController.navigationController?.popViewController(animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.registerBtn.frame = CGRect(x: 50, y: 0, width: self.contentView.bounds.width - 100, height: 46)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
