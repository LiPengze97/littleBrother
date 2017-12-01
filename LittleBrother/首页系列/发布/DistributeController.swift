//
//  DistributeViewController.swift
//  LittleBrother
//
//  Created by 李鹏泽 on 2017/11/15.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class DistributeController: UIViewController {
    
    var tableView: UITableView!
    var footerPanel: UIView!
    var distrButton: UIButton!
    var txView: UITextView!
    
    let distrButtonHeight: CGFloat = 48
    let dataArr = ["任务标题", "任务详情:", "任务地点", "添加赏金"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "发布任务"
        initTable()
        initFooter()
    }
    
    func initTable() {
        
        tableView = UITableView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh), style: .grouped)
        tableView.register(RightTextFieldCell.self, forCellReuseIdentifier: Identifier.distributeCellId)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedRowHeight = 0
        view.addSubview(tableView)
        
        txView = UITextView(frame: Rect(0, 0, ScreenWidth, 150))
        txView.textContainerInset = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
        txView.font = UIFont.systemFont(ofSize: 18.5)
        
    }
    
    func initFooter() {
        footerPanel = UIView(frame: Rect(0, 0, ScreenWidth, 200))
        tableView.tableFooterView = footerPanel
        distrButton = UIButton()
        footerPanel.addSubview(distrButton)
        distrButton.setTitle("发布任务", for: .normal)
        distrButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        distrButton.backgroundColor = Config.themeColor
        distrButton.clipsToBounds = true
        distrButton.layer.cornerRadius = distrButtonHeight/2
        distrButton.snp.makeConstraints{ make in
            make.width.equalTo(ScreenWidth/2)
            make.height.equalTo(distrButtonHeight)
            make.centerX.equalTo(footerPanel)
            make.top.equalTo(footerPanel).offset(20)
        }
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.isHidden = true
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = false
//    }
}
extension DistributeController: UITableViewDelegate, UITableViewDataSource {
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 150
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 && indexPath.section == 0 {
            return 45
        }
        return 54
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            return txView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let r = indexPath.row
        let s = indexPath.section
        if s == 0 && r == 1 {
            let cell = UITableViewCell()
            cell.textLabel?.text = dataArr[1]
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16.5)
            return cell
        }
        let cell = RightTextFieldCell(style: .default, reuseIdentifier: Identifier.distributeCellId)
        if s == 0 && r == 0 {
            cell.setRightArgs("5-20字", width: 150, size: 18.5, color: .gray)
            cell.setLeftText(dataArr[0], color: .black)
        } else if s == 1 && r == 0 {
            cell.setLeftText(dataArr[2], color: .black)
            cell.setRightArgs("送达地点(选填)", width: 220, size: 18.5, color: .gray)
        } else {
            cell.setRightArgs("元", width: 100)
            cell.setLeftText(dataArr[3], color: .black)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}





