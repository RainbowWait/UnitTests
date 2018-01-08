//
//  RegisterViewController.swift
//  TestUnit
//
//  Created by 郑小燕 on 2017/12/27.
//  Copyright © 2017年 郑小燕. All rights reserved.
//

import UIKit

struct CellName {
    let registerName = "RegisterCell"
    let codeName = "RegisterCodeCell"
    let footerName = "FooterView"
}
class RegisterViewController: UIViewController {

    @IBOutlet weak var listTable: UITableView!
    var cellName: CellName = CellName()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTable.delegate = self
        self.listTable.dataSource = self
        self.title = "注册"
//        listTable.register(RegisterCell.self, forCellReuseIdentifier: cellName)
        listTable.register(UINib.init(nibName: "RegisterCell", bundle: nil), forCellReuseIdentifier: cellName.registerName)
        listTable.register(UINib.init(nibName: "RegisterCodeCell", bundle: nil), forCellReuseIdentifier: cellName.codeName)
        listTable.register(FooterVier.self, forHeaderFooterViewReuseIdentifier: cellName.footerName)
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
extension RegisterViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName.registerName) as! RegisterCell
            cell.index = indexPath
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellName.codeName) as! RegisterCodeCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 46
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: cellName.footerName) as! FooterVier
        footerView.viewController = self
        return footerView
        
    }
    
    
}
