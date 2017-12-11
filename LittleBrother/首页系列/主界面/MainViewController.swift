//
//  MainViewController.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
let threeButtonHeight: CGFloat = 50
class MainViewController: UIViewController {
    var isLogin = 0
    var pagenum = 1
    var tableView: UITableView!
    var naviContentView: UniversityView!
    var loopView: CircleLoopView!
    var threeButton: ThreeButtonView!
    
    var dataArr = NSMutableArray(){
        didSet{
            self.tableView.reloadData()
        }
    }
    
    func loadData(){
        if isLogin == 0 {
            Alamofire.request(Router.nearbyTask("53d76162601b5d6c01601b5d781f0000", "0")).responseJSON(completionHandler: { (response) in
                switch response.result{
                case .success(_):
                    guard let value = response.result.value else{
                        log("response.result.value is nil", .error)
                        return
                    }
                    let json = JSON(value)
                    
                    print("📺",json)
                case .failure(let error):
                    log(error, .error)
                    return
                }
            })
        }
    }
    
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
        loadData()
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
        //return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainViewCell(style: .default, reuseIdentifier: Identifier.mainTableCellId)
        cell.nameLabel.text = ""
        cell.timeLabel.text = ""
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



