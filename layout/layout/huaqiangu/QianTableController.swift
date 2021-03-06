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
    
    let rowHeight: CGFloat = QianTableCell.rowHeight
    let reuseableCellName: String = "reuseableCell"
    var table: UITableView!
    var tableSource: [String] = [String](repeatElement("花千骨v花千骨v花千骨", count: 11)) // 创建重复数组
    var backBarButtonItem: UIBarButtonItem!
    
    convenience init(backBarButtonItem preBackItem: UIBarButtonItem?) {
        self.init()
        
        //debugPrint("preBackItem ?? Any.self")
        //debugPrint(preBackItem ?? Any.self)
        //self.backBarButtonItem = preBackItem!
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
        
        debugPrint("self.navigationItem.titleView?.tintColor ?? (Any).self")
        debugPrint(self.navigationItem.titleView?.tintColor ?? (Any).self)
        
        //self.navigationController?.title 是UIViewController的属性
        self.navigationController?.title = "卡片列表2" //tab bar 的title
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.gray.cgColor
        ]
        
        //设置页面标题
        self.navigationItem.title = "卡片列表"
        self.navigationItem.titleView?.backgroundColor = UIColor.gray
        self.navigationItem.titleView?.tintColor = UIColor.white
        
//        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "dsfs", style: .done, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem?.customView?.backgroundColor = UIColor.orange
//        //self.navigationItem.leftBarButtonItem?.image = #imageLiteral(resourceName: "personal_home_back_white_24x24_")
//        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
//
//        debugPrint("self.navigationItem.leftBarButtonItem?.title ?? (Any).self")
//        debugPrint(self.navigationItem.leftBarButtonItem?.title ?? (Any).self)
//
//        debugPrint("self.navigationItem.leftBarButtonItem?.customView?.frame.width ?? (Any).self")
//        debugPrint(self.navigationItem.leftBarButtonItem?.customView?.frame.width ?? (Any).self)
//
//        debugPrint("self.navigationItem.titleView?.frame ?? (Any).self")
//        debugPrint(self.navigationItem.titleView?.frame ?? (Any).self)
        
        //self.navigationItem.leftBarButtonItem = self.backBarButtonItem
        
        //self.navigationItem.largeTitleDisplayMode = .never
        
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
        self.table.separatorStyle = .singleLine
        self.table.separatorColor = ColorDefault.Theme
        self.table.backgroundColor = UIColor.white
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
    
    /// 选中第\(indexPath.row)行
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中第\(indexPath.row)行")
        
        ///设置导航栏
        //self.navigationItem.backBarButtonItem?.title = "" // 从这个视图跳转到另一个实图后，在另一个视图里面显示的返回title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回卡片列表", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.tintColor = UIColor.orange //设置导航栏的返回按钮颜色
        //将导航栏条透明
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //不调整与顶边的间距，因为此时导航条已经透明 
        
        let qian = GuTableController()
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




