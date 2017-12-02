//
//  MainViewController.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
let threeButtonHeight: CGFloat = 50
class MainViewController: UIViewController {

    var tableView: UITableView!
    var naviContentView: UniversityView!
    var loopView: CircleLoopView!
    var threeButton: ThreeButtonView!
    
    var dataArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNaviBar()
        initTable()
        initHeader()
        
    }
    
    func initNaviBar() {
        view.backgroundColor = UIColor.white
    }
    
    func initTable() {
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = 30+headImgHeight
        tableView.register(MainViewCell.self, forCellReuseIdentifier: Identifier.mainTableCellId)
        view.addSubview(tableView)
    }
    
    func initHeader() {
        
        //126*51
        let loopH = ScreenWidth*51/126
        loopView = CircleLoopView(frame: Rect(0, 0, ScreenWidth, loopH))
        threeButton = ThreeButtonView(frame: Rect(0, loopH, ScreenWidth, threeButtonHeight))
        loopView.setImgNames(["nanmonvlei", "waimai", "wajueji"])
        let header = UIView(frame: Rect(0, 0, ScreenWidth, loopH+threeButtonHeight+8))
        header.addSubview(loopView)
        header.addSubview(threeButton)
        tableView.tableHeaderView = header
    }
    
}
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
        //return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainViewCell(style: .default, reuseIdentifier: Identifier.mainTableCellId)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detail = DetailViewController()
        //some operations on detail
        pushWithoutTabBar(detail)
        
    }
    
    
    
}










