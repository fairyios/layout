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

