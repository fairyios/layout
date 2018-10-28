//
//  DetailController.swift
//  layout
//
//  Created by Fairy on 2018/10/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


/// MARK - 详情页面
class DetailController: UITableViewController {
    
    var  area: AreaModel? = nil
    
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtArea: UITextField!
    @IBOutlet weak var txtRemark: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var topView: UIView!
    
    
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
        
        self.topView.frame.size.height = self.view.frame.size.width
        self.topImage.frame.size.height =  self.view.frame.size.width
        self.topImage.image = UIImage(named: (area?.Image)!)
        self.txtAddress.text = self.area?.Address
        self.txtArea.text = self.area?.Area
        self.txtRemark.text = self.area?.Remark
        
        UIView.animate(withDuration: 10000, animations: {
            
        }) { bool in
            print("UIView.animate(withDuration: 1000, animations: {")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /// 保存
    ///
    /// - Parameter sender: sender description
    @IBAction func actionAction(_ sender: Any) {
        area?.Address = txtAddress.text
        area?.Area = txtArea.text
        area?.Remark = txtRemark.text
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
}

extension DetailController {
    
}
