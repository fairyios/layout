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
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

