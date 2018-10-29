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
    @IBOutlet weak var btnRating: UIButton!
    
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
        
        
        
        //withDuration:
        //  动画的总持续时间，以秒为单位。如果指定负值或0，则在不对其进行动画处理的情况下进行更改
        UIView.animate(withDuration: 1, animations: {
            self.topView.frame.size.height = self.view.frame.size.width
            self.topImage.frame.size.height =  self.view.frame.size.width
            self.topImage.image = UIImage(named: (self.area?.Image)!)
            self.txtAddress.text = self.area?.Address
            self.txtArea.text = self.area?.Area
            self.txtRemark.text = self.area?.Remark
            self.btnRating.backgroundColor = UIColor.yellow
        }) { bool in
            print("动画之行完毕")
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

// MARK: - UIStoryboardSegue
extension DetailController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ratingSegue" {
            let con = segue.destination as! RatingController
            con.area = self.area
        }
    }
    
    
    
    /// 评论后返回
    ///
    /// - Parameter segue: segue description
    @IBAction func closeRating(segue: UIStoryboardSegue) {
        
        if(segue.identifier == "backDetailUnwind") {
            let con = segue.source as! RatingController
            
            if let r = con.rating {
                self.btnRating.setImage(UIImage(named: r), for: .normal)
            }
            
        }
    }
}

