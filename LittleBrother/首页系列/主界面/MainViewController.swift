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
    var page: Int!
    
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

    ///
    ///我tm是服了 能返回学校ID的接口只有getSchools，那么我只有返回人，通过人的大学名，再调用 获取大学 得到数组，在这个数组里找到该大学，就知道关联的SchoolID。搞什么？？？草。胡闹
    //
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
    
    func logInRefresh() {
        person = userDefault.getCustomObj(for: kCurrentUserKey) as! Person //1
    
        school = person.school //注意，人属性的school里没有ID！ //2
      
//        HttpRequest.requestJSON(Router.getSchools) { _, code, data in
//            if code != 0 {
//                hud.showError(withStatus: "学校列表加载失败"); return
//            }
//            let dataArr = data.arrayValue
//            for i in 0..<dataArr.count {
//                let aSchool = School(dataArr[i])
//                if aSchool.name == self.school.name {
//                    self.school.id = aSchool.id; break
//                }
//            }
//            self.loadData(of: self.school.id) //3
//            self.naviContentView.fillContents(self.school) //4
//            hud.dismiss()
//        }
        self.loadData(of: self.school.id) //3
        self.naviContentView.fillContents(self.school) //4
    }
    
    func selectSchool(_ school: School) {
        self.school = school
        naviContentView.fillContents(school)
        dataArr.removeAllObjects()
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
        detail.mission = dataArr[indexPath.row] as? Mission
        pushWithoutTabBar(detail)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isHidden = false
    }
    
}



