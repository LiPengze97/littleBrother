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
///初始化时赋值school 默认=？
class MainViewController: UIViewController, SelectSchoolProtocol {

    var tableView: UITableView!
    var naviContentView: UniversityView!
    var loopView: CircleLoopView!
    var threeButton: ThreeButtonView!
  
    var isLogin: Bool = false
     
    var school: School!
    var dataArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNaviBar()
        initTable()
        initHeader()
        
    }
    
    func initNaviBar() {
        view.backgroundColor = UIColor.white
        navigationItem.titleView = UIView(frame: Rect(0, 0, ScreenWidth, 44))
        let w = navTitleHeight*463/63+58
        naviContentView = UniversityView(frame: Rect((ScreenWidth-w)/2, 30, w, navTitleHeight))
        naviContentView.fillContents(nil)
        DispatchQueue.main.async {
            self.naviContentView.frame = (self.view.window?.convert(self.naviContentView.frame, to: self.navigationItem.titleView))!
            self.navigationItem.titleView?.addSubview(self.naviContentView)
        }
        naviContentView.button.addTarget(self, action: #selector(selectClick), for: .touchUpInside)
        hud.setMaximumDismissTimeInterval(0.38)
    }
    
    func selectSchool(_ id: String, _ name: String) {
        self.school = School(id: id, name: name)
        naviContentView.fillContents(school)
    }
    
    @objc func selectClick() {
        if userDefault.bool(forKey: kIsSignedIn) {
            let selectVC = SelectSchoolController()
            selectVC.currentSchool = school.name
            selectVC.delegate = self
            pushWithoutTabBar(selectVC)
        } else {
            let signin = UINavigationController(rootViewController: PhoneNumberController())
            present(signin, animated: true)
        }
        
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
    
    @objc func didTap(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 100 {
            pushWithoutTabBar(DistributeController())
        } else {
            pushWithoutTabBar(MyOrdersController())
        }
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
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(didTap))
        threeButton.post.addGestureRecognizer(tap1)
        threeButton.post.tag = 100
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(didTap))
        threeButton.my.addGestureRecognizer(tap2)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.isLogin = userDefault.bool(forKey: kIsSignedIn)
        navigationController?.navigationBar.isHidden = false
    }
    
}



