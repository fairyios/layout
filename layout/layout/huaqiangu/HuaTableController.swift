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
    var tableSource: [String] = [String](repeatElement("花千骨v花千骨v花千骨", count: 11)) // 创建重复数组
    
    
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
        return tableSource.count
    }
    
    
    /// 单元格内容展示信息
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("单元格内容展示信息 UITableViewCell")
        let source = self.tableSource[indexPath.row]
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseableCellName) as? HuaTableCell
        if (cell == nil) {
            cell = HuaTableCell(style: .default, reuseIdentifier: self.reuseableCellName)
        }
        
        cell?.myLabel.text = source
        return cell!
    }
    
    
}


// MARK: - UITableViewDelegate
extension HuaTableController: UITableViewDelegate {
    
    
    /// Tells the delegate that the specified row is now selected.
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中第\(indexPath.row)行")
        
        //self.navigationItem.backBarButtonItem?.title = "" // 从这个视图跳转到另一个实图后，在另一个视图里面显示的返回title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        let qian = QianTableController(backBarButtonItem: self.navigationItem.backBarButtonItem)
        self.show(qian, sender: nil)
    }
    
    
    /// 行内右滑：删除+分享
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .destructive, title: LocalizedHelper.Share) { (UITableViewRowAction, IndexPath) in
            
        }
        let delteAction = UITableViewRowAction(style: .normal, title: LocalizedHelper.Delete) { (action,index) in
            self.FuncDeleteAction(indexPath: indexPath)
        }
        return [shareAction, delteAction]
    }
    
    /// 删除行
    ///
    /// - Parameter indexPath: indexPath description
    private func FuncDeleteAction(indexPath: IndexPath) {
        let con = UIAlertController(title: "删除?", message: "是否确定删除,删除之后数据无法恢复?", preferredStyle: .alert)
        con.addAction(UIAlertAction(title: LocalizedHelper.Cancel, style: .cancel, handler: nil))
        con.addAction(UIAlertAction(title: LocalizedHelper.Delete, style: .destructive, handler: {(ac)->Void in
            self.tableSource.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .automatic)
            print("删除成功")
        }))
        self.present(con, animated: true, completion: {() -> Void in
            print("以模态方式呈现视图控制器")
        })
    }
}




