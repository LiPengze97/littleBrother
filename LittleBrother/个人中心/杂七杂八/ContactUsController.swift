//
//  ContactUs.swift
//  LittleBrother
//
//  Created by Eric on 15/11/2017.
//  Copyright © 2017 INGSwifters. All rights reserved.
//

import Foundation
import UIKit
class ContactController: UIViewController {
    
    var contentView: UIView!
    
    override func loadView() {
        let view1 = UIScrollView(frame: Rect(0, 0, ScreenWidth, ScreenHeigh))
        view1.alwaysBounceVertical = true
        view1.showsVerticalScrollIndicator = false
        view = view1
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "联系我们"
        view.backgroundColor = UIColor.white
        contentView = UIView()
        view.addSubview(contentView)
        // 987*1115高
        contentView.snp.makeConstraints{ make in
            make.centerX.width.equalTo(view)
            make.top.equalTo(23)
            make.height.equalTo(ScreenWidth*1115/987)
        }
        contentView.layer.contents = #imageLiteral(resourceName: "parterner").cgImage
        contentView.layer.contentsGravity = kCAGravityResizeAspectFill
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}





