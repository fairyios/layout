//
//  ViewController.swift
//  layout
//
//  Created by Fairy on 2018/10/25.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

class TableController: UIViewController {
    
    

    var areas: [AreaModel] = AreaModel.getDemos()
    var searchController: UISearchController!
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUISearchController()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //guard LocalSet.IsLaunched == true else { return }
        
        //let dynamic = DynamicPageController()
        //self.present(dynamic, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


// MARK: - 搜索栏 UISearchControllerDelegate, UISearchResultsUpdating
extension TableController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    func initUISearchController() {
        
        let baseColor = self.navigationController?.navigationBar.barTintColor
        
        //        let ui = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        //        ui.backgroundColor = UIColor.yellow
        //        self.myTableView.tableHeaderView = ui
        
        //self.searchController = UISearchController()
        self.searchController = UISearchController(searchResultsController: nil)
        //dimsBackgroundDuringPresentation 此属性仅控制原始视图控制器是否最初被遮挡
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.searchBar.backgroundColor = UIColor.gray
        //self.searchController.searchBar.barTintColor = baseColor//background
        self.searchController.searchBar.alpha = 0.8
        //self.searchController.searchBar.prompt = "提示说明" //A single line of text displayed at the top of the search bar.
        self.searchController.searchBar.tintColor = baseColor
        self.searchController.delegate = self
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.barStyle = .blackTranslucent
        self.searchController.searchBar.searchBarStyle = .prominent
        self.searchController.searchBar.placeholder = "请输入关键字"
        //self.searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        self.searchController.searchBar.sizeToFit()
        
        self.searchController.view.backgroundColor = UIColor.clear
        //self.searchController.view.frame = (self.myTableView.tableHeaderView?.frame)!
        self.myTableView.tableHeaderView = self.searchController.searchBar
    }
    
    
    /// Called when the search bar's text or scope has changed or when the search bar becomes first responder.
    /// 当搜索栏的文本或范围发生变化或搜索栏成为第一响应者时调用
    /// - Parameter searchController: searchController description
    func updateSearchResults(for searchController: UISearchController) {
        debugPrint(searchController.searchBar.text!)
        
        guard searchController.searchBar.text == nil else { return }
        let keyword = (searchController.searchBar.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        
        //self.areas = self.areas.filter { $0.Address.contains(keyword!) }
        self.areas = self.areas.filter { $0.Address.localizedStandardContains(keyword) }
        self.myTableView.reloadData()
    }
    
}


// MARK: - 业务逻辑
extension TableController {
    
    /// 删除行
    ///
    /// - Parameter indexPath: indexPath description
    public func FuncDeleteAction(indexPath: IndexPath) {
        let con = UIAlertController(title: "删除?", message: "是否确定删除？", preferredStyle: .alert)
        con.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        con.addAction(UIAlertAction(title: "删除", style: .destructive, handler: {(ac)->Void in
            self.areas.remove(at: indexPath.row)
            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            print("删除成功")
        }))
        self.present(con, animated: true, completion: {() -> Void in
            print("以模态方式呈现视图控制器")
        })
    }
    
    
    
    
}


// MARK: - UIStoryboardSegue
extension TableController {
    //override func p
    //DetailController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 显示详情页面
        if segue.identifier == "detailSegue" {
            
            let row = (self.myTableView.indexPathForSelectedRow?.row)!
            let con = segue.destination as! DetailController
            con.area = self.areas[row]
        }
    }
}

// MARK: - UITableViewDelegate
extension TableController : UITableViewDelegate {
    
    
    /// 选中第几行
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt=\(indexPath.row)")
        
    }
    
    
    /// 在一行调用减号或加号按钮后（基于单元格的UITableViewCellEditingStyle），dataSource必须提交更改
    /// 不使用UITableViewRowAction调用编辑操作 - 将调用操作的处理程序
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - editingStyle: editingStyle description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.FuncDeleteAction(indexPath: indexPath)
        }
        else if editingStyle == .insert {
            
        }
        else if editingStyle == .none {
            
        }
        
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//
//    }
    
    
    /// Tells the delegate that the table view has left editing mode.
    ///    当用户在indexPath标识的行上滑动进入模式后，表视图退出编辑模式时，将调用其方法。
    ///    结果，行中出现删除按钮; 但是，在这个“????刷卡删除”???? 模式表视图不显示任何插入，
    ///    删除和重新排序控件。 当输入这个“????刷卡删除”???? 编辑模式，表视图发送一个
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        print("didEndEditingRowAt")
    }
    
    
    /// 单个行可以选择不为它们设置-editing属性。 如果未实现，则假定所有行都是可编辑的。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    /// Tells the delegate that the table view is about to go into editing mode.
    /// 告知代理表视图即将进入编辑模式。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        
    }
    
    
//    /// 要求数据源返回具有给定标题和节标题索引的节的索引。
//    ///
//    /// - Parameters:
//    ///   - tableView: tableView description
//    ///   - title: title description
//    ///   - index: index description
//    /// - Returns: return value description
//    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
//        return 1
//    }
    
    
    
    /// Tells the delegate that a specified row is about to be selected.
    /// 告诉委托者即将选择指定的行
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        
        return indexPath
    }
    
    
    /// Tells the delegate that a specified row is about to be deselected.
    /// 告诉委托者即将取消选择指定的行。
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    
    
    /// 行内右滑：删除+分享
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .destructive, title: "分享") { (UITableViewRowAction, IndexPath) in
            
        }
        let delteAction = UITableViewRowAction(style: .normal, title: "删除") { (action,index) in
            self.FuncDeleteAction(indexPath: indexPath)
        }
        return [shareAction, delteAction]
    }
    
}


// MARK: - UITableViewDataSource
extension TableController : UITableViewDataSource {
    
    
    /// 行数
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - section: section description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count
    }
    
    
    
    /// 重复使用单元格
    ///
    /// - Parameters:
    ///   - tableView: tableView description
    ///   - indexPath: indexPath description
    /// - Returns: return value description
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let area = areas[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! UITableViewCellReusable
        cell.leftImage.image = UIImage(named: area.Image)
        cell.rightAddress.text = area.Address
        cell.rightArea.text = area.Area
        cell.rightRemark.text = area.Remark
        
        cell.leftImage.backgroundColor = UIColor.white
        cell.leftImage.layer.cornerRadius = (cell.leftImage.frame.size.width)/2
        cell.leftImage.clipsToBounds = true
        return cell
    }
    
    
}

