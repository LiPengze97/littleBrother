//
//  MainView.swift
//  LittleBrother
//
//  Created by Eric on 11/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
extension MainViewController {
    
    
    func initTable() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = 30+headImgHeight
        tableView.register(MainViewCell.self, forCellReuseIdentifier: Identifier.mainTableCellId)
        view.addSubview(tableView)
        tableView.tableFooterView = UIView()
    }
    
    func initNaviBar() {
        view.backgroundColor = UIColor.white
        navigationItem.titleView = UIView(frame: Rect(0, 0, ScreenWidth, 44))
        let w = navTitleHeight*463/63+58
        naviContentView = UniversityView(frame: Rect((ScreenWidth-w)/2, 30, w, navTitleHeight))
        
        DispatchQueue.main.async {
            self.naviContentView.frame = (self.view.window?.convert(self.naviContentView.frame, to: self.navigationItem.titleView))!
            self.navigationItem.titleView?.addSubview(self.naviContentView)
        }
        naviContentView.button.addTarget(self, action: #selector(selectClick), for: .touchUpInside)
        hud.setMaximumDismissTimeInterval(0.38)
    }
    
    func initHeader() {
        
        let loopH = ScreenWidth*51/126 //126*51
        loopView = CircleLoopView(frame: Rect(0, 0, ScreenWidth, loopH))
        threeButton = ThreeButtonView(frame: Rect(0, loopH, ScreenWidth, threeButtonHeight))
        loopView.setImgNames(["nanmonvlei", "waimai", "wajueji"])
        let header = UIView(frame: Rect(0, 0, ScreenWidth, loopH+threeButtonHeight+8))
        header.addSubview(loopView)
        header.addSubview(threeButton)
        tableView.tableHeaderView = header
        if threeButton.post.tag != 100 {
            threeButton.post.addTapGest(target: self, action: #selector(didTap))
            threeButton.post.tag = 100
            threeButton.my.addTapGest(target: self, action: #selector(didTap))
        }
    }
    
}
