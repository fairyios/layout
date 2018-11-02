//
//  QianTableController.swift
//  layout
//
//  Created by Fairy on 2018/11/1.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


// QianTableController
final class QianTableController: UIViewController {
    
    let rowHeight: CGFloat = CGFloat(80)
    let reuseableCellName: String = "reuseableCell"
    var table: UITableView!
    var tableSource: [String] = [String](repeatElement("花千骨v花千骨v花千骨", count: 11)) // 创建重复数组
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
        
        debugPrint("self.navigationController?.toolbarItems ?? (Any).self")
        debugPrint(self.navigationController?.toolbarItems ?? (Any).self)
        
        debugPrint("self.navigationController?.navigationBar ?? (Any).self")
        debugPrint(self.navigationController?.navigationBar ?? (Any).self)
        
        debugPrint("self.navigationController?.navigationBar.backItem ?? (Any).self")
        debugPrint(self.navigationController?.navigationBar.backItem ?? (Any).self)
        
        debugPrint("self.navigationController?.navigationBar.items?.count ?? (Any).self")
        debugPrint(self.navigationController?.navigationBar.items?.count ?? (Any).self)
        
        debugPrint("self.navigationController?.navigationBar.items?.first?.title ?? (Any).self")
        debugPrint(self.navigationController?.navigationBar.items?.first?.title ?? (Any).self)
        
        debugPrint("self.navigationController?.navigationItem.title ?? (Any).self")
        debugPrint(self.navigationController?.navigationItem.title ?? (Any).self)
        
        debugPrint("self.navigationItem.backBarButtonItem ?? (Any).self")
        debugPrint(self.navigationItem.backBarButtonItem ?? (Any).self)
        
        debugPrint("self.navigationItem.leftBarButtonItem ?? (Any).self")
        debugPrint(self.navigationItem.leftBarButtonItem ?? (Any).self)
        
        //self.navigationController?.title 是UIViewController的属性
        self.navigationController?.title = "卡片列表2"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationItem.title = "卡片列表"
        self.navigationItem.titleView?.tintColor = UIColor.white
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "hgghg", style: .plain, target: nil, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "dsfs", style: .done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        debugPrint("self.navigationItem.backBarButtonItem?.title ?? (Any).self")
        debugPrint(self.navigationItem.backBarButtonItem?.title ?? (Any).self)
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
        //self.table.register(UINib(nibName: "QianTableCell", bundle: nil), forCellReuseIdentifier: "Nib")
        //self.table.register(QianTableCell.self, forCellReuseIdentifier: self.reuseableCellName)
        self.table.register(QianTableCell.classForCoder(), forCellReuseIdentifier: self.reuseableCellName)
        
        self.view.addSubview(self.table)
        
        //self.table.sizeToFit()//调整接收器视图的大小并移动它，使其只包含其子视图
    }
}


// MARK: - UITableViewDataSource
extension QianTableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseableCellName) as? QianTableCell
        if (cell == nil) {
            cell = QianTableCell(style: .default, reuseIdentifier: self.reuseableCellName)
        }
        return cell!
    }
    
    
}


// MARK: - UITableViewDelegate
extension QianTableController: UITableViewDelegate {
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




