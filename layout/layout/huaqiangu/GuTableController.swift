//
//  GuViewController.swift
//  layout
//
//  Created by Fairy on 2018/11/5.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class GuTableController: UITableViewController {
    
    
    /// 图片【UIImageView 设置圆角“imageView.clipsToBounds = true”后阴影效果会消失】
    lazy var myImageView: UIImageView! = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "huaqiangu_logo_600x600iPadPortraitiOS56_768x1024pt"))
        //imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = CGFloat(0)
        //imageView.clipsToBounds = true//设置为true，阴影失效
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = ColorDefault.Theme.cgColor
        //imageView.frame.width = self.tableView.tableHeaderView?.frame.width
        
        //let imageTop = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.tableView.tableHeaderView, attribute: .top, multiplier: 1, constant: 0)
        //let imageBottom = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self.tableView.tableHeaderView, attribute: .bottom, multiplier: 1, constant: 0)
        //let imageLeading = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.tableView.tableHeaderView, attribute: .leading, multiplier: 1, constant: 0)
        //let imageTrailing = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self.tableView.tableHeaderView, attribute: .trailing, multiplier: 1, constant: 0)
        
        
        
        //self.tableView.tableHeaderView?.addConstraints([imageTop, imageBottom, imageLeading, imageTrailing])
        
        
        return imageView
    }()
    
    
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置页面标题
        self.navigationItem.title = "卡片详情"
        //self.navigationItem.titleView?.backgroundColor = UIColor.gray // un do
        //self.navigationItem.titleView?.tintColor = UIColor.orange// un do
        
        self.tableView.tableHeaderView = self.myImageView//
        self.tableView.tableHeaderView?.frame.size.height = CGFloat(400)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


extension GuTableController {
    
}
