//
//  HuaTableController.swift
//  layout
//
//  Created by Fairy on 2018/11/1.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


// HuaTableController
final class HuaTableController: UIViewController {
    
    let rowHeight: CGFloat = CGFloat(80)
    let reuseableCellName: String = "reuseableCell"
    var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initTableView() {
        self.table = UITableView()
        self.table.rowHeight = rowHeight
        //self.table.isUserInteractionEnabled = false //点击不变背景颜色,不能滚动
        self.table.backgroundColor = UIColor.clear
        self.table.frame = self.view.frame
        self.table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.table.separatorColor = UIColor.orange
        self.table.separatorStyle = .singleLine
        self.table.dataSource = self
        self.table.delegate = self
        //self.table.register(UINib(nibName: "HuaTableCell", bundle: nil), forCellReuseIdentifier: "Nib")
        //self.table.register(HuaTableCell.self, forCellReuseIdentifier: self.reuseableCellName)
        self.table.register(HuaTableCell.classForCoder(), forCellReuseIdentifier: self.reuseableCellName)
        
        self.view.addSubview(self.table)
        
        //self.table.sizeToFit()//调整接收器视图的大小并移动它，使其只包含其子视图
    }
}


// MARK: - UITableViewDataSource
extension HuaTableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseableCellName) as? HuaTableCell
        if (cell == nil) {
            cell = HuaTableCell(style: .default, reuseIdentifier: self.reuseableCellName)
        }
        return cell!
    }
    
    
}


// MARK: - UITableViewDelegate
extension HuaTableController: UITableViewDelegate {
    
}




