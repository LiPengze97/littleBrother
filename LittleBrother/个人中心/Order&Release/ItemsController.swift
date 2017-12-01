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
    var urlRequest: URLRequestConvertible!
    
    init(url: URLRequestConvertible?) {
        super.init(nibName: nil, bundle: nil)
        urlRequest = url
    }

    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: Identifier.carryOnCellId)
        table.delegate = self
        table.dataSource = self
        table.rowHeight = 60
        view.addSubview(table)
        table.snp.makeConstraints{ make in
            make.center.size.equalTo(view)
        }

        table.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: Identifier.carryOnCellId)
        cell.textLabel?.text = "row: \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.cellForRow(at: indexPath)?.setSelected(false, animated: true)
        
        
    }
    
    
}






