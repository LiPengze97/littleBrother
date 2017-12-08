//
//  SelectSchool.swift
//  LittleBrother
//
//  Created by Eric on 02/12/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
import YUChineseSorting
import Alamofire
import SwiftyJSON

protocol SelectSchoolProtocol {
    func selectSchool(_ school: String)
}

class SelectSchoolController: UITableViewController {
    
    ///原始数据
    let schools = ["中学3", "中学2","大学5","大学4","大学3","大学2","大学1", "中学1", "小学2", "小学1", "小学3"]
    ///ABCZ数组
    var indexArr: NSMutableArray!
    ///二维数组，存的真数据
    var letterResultArr: NSMutableArray!
    
    ///这是初始化本view controller时候要传进来的
    var currentSchool: String!
    var delegate: SelectSchoolProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(Router.getSchools).responseJSON { (response) in
            switch response.result{
            case .success:
                guard let value = response.result.value else{
                    log("response.result.value is nil", .error)
                    return
                }
                let json = JSON(value)
                print("📺",json)
                
                
                return
            case .failure(let error):
                log(error, .error)
                return
            }
        }
        
        title = "选择学校"
        ///结果是：D，X，Z
        indexArr = ChineseString.indexArray(schools)
        
        ///结果是：数组里面套数组，[[大1，大2]，[小]，[中]]
        letterResultArr = ChineseString.letterSortArray(schools)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.systemStyleCellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: Identifier.tableheaderViewId)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        //TODO: - 等确定了大学模式再说。什么玩意啊。。。
        if indexPath.section == 0 {
            
        } else {
            
        }
        delegate?.selectSchool(schools[indexPath.row])
        navigationController?.popViewController(animated: true)
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArr as? [String]
//        let arr = (indexArr.copy() as! NSMutableArray)
//        arr.insert("0", at: 0)
//        return arr as? [String]
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        tableView.selectRow(at: IndexPath(row: 0, section: index+1), animated: true, scrollPosition: .top)
        return index + 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let vie = UITableViewHeaderFooterView(reuseIdentifier: Identifier.tableheaderViewId)
        vie.textLabel?.text = indexArr[section-1] as? String
        vie.textLabel?.backgroundColor = UIColor.groupTableViewBackground
        return vie;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Identifier.systemStyleCellId)
        if indexPath.section == 0 {
            cell.accessoryType = .checkmark
            if currentSchool == nil {
                print("😭😭😭: 进来时候没赋值当前学校！！！")
                cell.textLabel?.text = "当前学校: 无"
            } else {
                cell.textLabel?.text = "当前学校:  " + currentSchool
            }
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.textColor = UIColor.darkGray
        } else {
            cell.textLabel?.text = ((letterResultArr[indexPath.section-1] as! NSArray)[indexPath.row]) as? String
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return indexArr.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return (letterResultArr[section-1] as! NSArray).count
    }

}
