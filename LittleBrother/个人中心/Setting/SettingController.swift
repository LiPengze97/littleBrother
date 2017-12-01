//
//  SettingController.swift
//  LittleBrother
//
//  Created by Eric on 14/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class SettingController: UIViewController {
    
    var tableView: UITableView!
    var footerPanel: UIView!
    var logOut: UIButton!
    
    let logOutHeight: CGFloat = 48
    let dataArr = ["用户协议", "我的地址", "清理缓存", "检查更新" ,"联系客服"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "设置"
        initTable()
        initFooter()
    }
    
    func initTable() {
        tableView = UITableView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh), style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.settingCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 63
        view.addSubview(tableView)
        
    }
    
    func initFooter() {
        footerPanel = UIView(frame: Rect(0, 0, ScreenWidth, 200))
        tableView.tableFooterView = footerPanel
        logOut = UIButton()
        footerPanel.addSubview(logOut)
        logOut.setTitle("退出登陆", for: .normal)
        logOut.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        logOut.backgroundColor = Config.themeColor
        logOut.clipsToBounds = true
        logOut.layer.cornerRadius = logOutHeight/2
        logOut.snp.makeConstraints{ make in
            make.width.equalTo(ScreenWidth/2)
            make.height.equalTo(logOutHeight)
            make.centerX.equalTo(footerPanel)
            make.top.equalTo(footerPanel).offset(20)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
}

extension SettingController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Identifier.settingCellId)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = dataArr[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18.5)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        switch indexPath.row {
        case 0:
            pushWithoutTabBar(UserProtocolController())
        case 4:
            pushWithoutTabBar(ContactController())
        default: break
        }
        
    }
    
}









