//
//  PersonViewController.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class PersonViewController: UIViewController {
    
    var isLogin = false
    var tableView: UITableView!
    var headerView: HeadView!
    let dataArr = ["我的钱包", "推荐有奖", "意见反馈", "联系我们", "设置"]
    let imgArr = [#imageLiteral(resourceName: "qianbao"), #imageLiteral(resourceName: "tuijian"), #imageLiteral(resourceName: "yijian"), #imageLiteral(resourceName: "lianxi"), #imageLiteral(resourceName: "shezhi")]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        initHeaderView()
        loadData()
        
    }
    
    func loadData() {
        self.isLogin = userDefault.bool(forKey: kIsSignedIn)
       
        HttpRequest.requestJSON(Router.getUserOwnInfo) { res, code, data in
            
        }
 
    }
 
    @objc func labelTap() {
        
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        if !isLogin  {
           
        }
        switch sender.tag {
        case 1000:
            pushWithoutTabBar(MyOrdersController())
        case 1001:
            pushWithoutTabBar(MyReleaseController())
        case 1002:
            pushWithoutTabBar(AuthenController(style: .grouped))
        default: break
        }
        
    }
}

/// View:
extension PersonViewController: UITableViewDelegate, UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Identifier.personCellId)
        
        if indexPath.section == 1 {
            cell.textLabel?.text = dataArr[4]
            cell.imageView?.image = imgArr[4]
        } else {
            cell.textLabel?.text = dataArr[indexPath.row]
            cell.imageView?.image = imgArr[indexPath.row]
        }
        
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        if !isLogin {
            
            return
        }
        if indexPath.section == 1 {
            pushWithoutTabBar(SettingController()); return
        }
        switch indexPath.row {
        case 0:
            pushWithoutTabBar(WalletController())
        case 1:
            pushWithoutTabBar(RecommentController())
        case 2:
            pushWithoutTabBar(ReflectController())
        case 3:
            pushWithoutTabBar(ContactController())
        default: break;
        }
 
    }
 
    func initHeaderView() {
        navigationController?.navigationBar.isHidden = true
        headerView = HeadView(frame: Rect(0, 0, ScreenWidth, ScreenWidth*79/150+65))
        tableView.tableHeaderView = headerView
        headerView.myUpLoad?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        headerView.myBill?.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        headerView.myBill?.tag = 1000
        headerView.myUpLoad?.tag = 1001
        headerView.authentic?.tag = 1002
        headerView.nameLabel?.addTapGest(target: self, action: #selector(labelTap))
        headerView.headImageView?.addTapGest(target: self, action: #selector(labelTap))
        headerView.authentic?.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
    }
    
    func initTableView() {
        tableView = UITableView(frame: Rect(0, -20, ScreenWidth, ScreenHeigh+20), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.personCellId)
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = 60
        view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 1
        }
        return 4
    }
    
}







