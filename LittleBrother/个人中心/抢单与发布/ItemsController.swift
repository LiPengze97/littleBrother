//
//  CarryOnController.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
class ItemsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var table: UITableView!
    var dataArr = NSMutableArray()
    var page = 0

    var isMyAccept: Bool!
    var status: MissionStatus!
    
    
    init(isMyAccept: Bool, _ status: MissionStatus) {
        super.init(nibName: nil, bundle: nil)
        
        self.isMyAccept = isMyAccept
        self.status = status
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTable()
        loadData()
    }
 
    func loadData(_ page: Int = 0) {
        
        let url = getURLRequest(page: "\(page)")
       
        HttpRequest.requestJSON(url) { _, code, data in
            switch code {
            case 0:
                let tempArr = data.arrayValue
                for i in tempArr {
                    let m = Mission(i)
                    self.dataArr.add(m)
                }
                self.table.reloadData()
            case 201:
                self.reLogin {
                    self.dataArr.removeAllObjects()
                    self.loadData()
                }
            default: hud.showError(withStatus: "服务器未响应")
            }
        }
        
    }
    
    func getURLRequest(page: String) -> URLRequestConvertible {
        
        var url: URLRequestConvertible
        
        if isMyAccept {
            url = Router.myAcceptTasks(status.rawValue, page)
        } else {
            url = Router.myPostTasks(status.rawValue, page)
        }
        
        return url
        
    }
   
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initTable() {
        table = UITableView()
        table.register(MainViewCell.self, forCellReuseIdentifier: Identifier.mainTableCellId)
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 0
        table.rowHeight = 27+headImgHeight
        view.addSubview(table)
        table.snp.makeConstraints{ make in
            make.center.size.equalTo(view)
        }
        table.tableFooterView = UIView()
    }
    
}






