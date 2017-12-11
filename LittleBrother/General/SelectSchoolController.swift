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

protocol SelectSchoolDelegate {
    func selectSchool(_ school: School)
}

///初始化时传进 currentSchool
class SelectSchoolController: UITableViewController {
    
    ///原始大学数据: School
    var schoolsArr = NSMutableArray()
    ///schoolNameArr: String
    var schoolNameArr = NSMutableArray()
    
    ///ABCZ [String]
    var indexArr = NSMutableArray()
    ///二维数组 [[String]]
    var letterResultArr = NSMutableArray()
    
    ///初始化本view controller时候要传进来的
    var currentSchool = unKnown
    
    var delegate: SelectSchoolDelegate?
    
    func loadData() {
        hud.show()
        HttpRequest.requestJSON(Router.getSchools) { _, code, data in
            if code != 0 {
                hud.showError(withStatus: "学校列表加载失败"); return
            }
            let dataArr = data.arrayValue
            var aSchool: School
            for i in 0..<dataArr.count {
                aSchool = School(dataArr[i])
                self.schoolsArr.add(aSchool)
                self.schoolNameArr.add(aSchool.name)
            }
          
            self.indexArr = ChineseString.indexArray(self.schoolNameArr as! [Any])
            self.letterResultArr = ChineseString.letterSortArray(self.schoolNameArr as! [Any])

            self.tableView.reloadData()
            hud.dismiss()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        loadData()
    }
    
    func initTable() {
        title = "选择学校"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.systemStyleCellId)
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: Identifier.tableheaderViewId)
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
    }
  
    //MARK: - 2 basic tableview methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Identifier.systemStyleCellId)
        if indexPath.section == 0 {
            cell.accessoryType = .checkmark
            cell.textLabel?.text = "当前学校:  " + currentSchool
            cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            cell.textLabel?.textColor = UIColor.darkGray
        } else {
            cell.textLabel?.text = ((letterResultArr[indexPath.section-1] as! NSArray)[indexPath.row]) as? String
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        
        if indexPath.section == 0 {
            navigationController?.popViewController(animated: true)
        } else {
            let schoo = schoolsArr[indexPath.row] as! School
            delegate?.selectSchool(schoo)
            navigationController?.popViewController(animated: true)
        }
    
    }
    
    
    //MARK: - headers and titles for section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }
        let vie = UITableViewHeaderFooterView(reuseIdentifier: Identifier.tableheaderViewId)
        vie.textLabel?.text = indexArr[section-1] as? String
        vie.textLabel?.backgroundColor = UIColor.groupTableViewBackground
        return vie;
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var arr = [String]()
        arr.append(UITableViewIndexSearch)
        let count = indexArr.count, indexArrStr = indexArr as! [String]
        
        if count > 0 {
            arr.append(indexArrStr[0])
        }
        for i in 1..<count {
            arr.append("·")
            arr.append(indexArrStr[i])
        }
        arr.append("#")
        return arr
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        var idx = index/2 + 1
        if title == "#" {
            idx -= 1
        }
        //TODO: - 屏蔽下面这行试试什么效果
        tableView.selectRow(at: IndexPath(row: 0, section: idx), animated: true, scrollPosition: .top)
        return idx
    }
    
 
    //MARK: - heights
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 30
    }
    
    //MARK: - numbers
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
