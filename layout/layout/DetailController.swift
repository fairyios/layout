//
//  DetailController.swift
//  layout
//
//  Created by Fairy on 2018/10/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {
    
    var  area: AreaModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "详情页面"
        
        // [segue:show.push]时,self.navigationItem.backBarButtonItem=nil,此时也不需要重新赋值(backBarButtonItem = UIBarButtonItem)
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem?.title = "返回"
//        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.white

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "分享", style: .done, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        guard area != nil else { return }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
