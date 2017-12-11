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

class MainViewController: UIViewController, SelectSchoolDelegate {

    var tableView: UITableView!
    var naviContentView: UniversityView!
    var loopView: CircleLoopView!
    var threeButton: ThreeButtonView!
  
    var school: School!
    var person: Person!
    var dataArr = NSMutableArray()
    
    //
    //
    // 每次打开app或15分钟不操作：session 失效，得重新登，输手机号、验证码 哪有这样的啊？？搞笑吗
    // 还存个屁本地？唉，先完成再说吧，等他到手用了就知道不爽了就要改需求啦😁
    //
    //
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNaviBar()
        initTable()
        initHeader()
        if userDefault.bool(forKey: kIsSignedIn) {
            logInRefresh()
        } else {
            loadData(of: defalutSchoolId)
            naviContentView.fillContents(School(defalutSchoolId, unKnown))
        }
        
        
    }

    func loadData(of schoolId: String, page: Int = 0) {
        
        HttpRequest.requestJSON(Router.nearbyTask(schoolId, page)) { _, code, data in
            switch code {
            case 0:
                let tempArr = data.arrayValue
                for i in tempArr {
                    let m = Mission(i)
                    self.dataArr.add(m)
                }
                self.tableView.reloadData()
            default: hud.showError(withStatus: "服务器未响应")
            }
        }
        
    }
    
    func selectSchool(_ school: School) {
        self.school = school
        naviContentView.fillContents(school)
        loadData(of: school.id)
    }
    
    @objc func selectClick() {
        if userDefault.bool(forKey: kIsSignedIn) {
            let selectVC = SelectSchoolController()
            selectVC.currentSchool = school.name
            selectVC.delegate = self
            pushWithoutTabBar(selectVC)
        } else {
            let signin = PhoneNumberController()
            signin.loginDidFinishHandler = {
                hud.showSuccess(withStatus: "登陆成功")
                self.logInRefresh()
            }
            present(UINavigationController(rootViewController: signin), animated: true)
        }
        
    }
    
    func logInRefresh() {
        person = userDefault.getCustomObj(for: kCurrentUserKey) as! Person
        school = person.school
        loadData(of: school.id)
        naviContentView.fillContents(school)
    }
    
    @objc func didTap(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 100 {
            pushWithoutTabBar(DistributeController())
        } else {
            pushWithoutTabBar(MyOrdersController())
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainViewCell(style: .default, reuseIdentifier: Identifier.mainTableCellId)
        cell.fillContents(dataArr[indexPath.row])
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

        navigationController?.navigationBar.isHidden = false
    }
    
}



