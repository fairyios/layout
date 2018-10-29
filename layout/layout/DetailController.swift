//
//  DetailController.swift
//  layout
//
//  Created by Fairy on 2018/10/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit
import MobileCoreServices


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
    @IBOutlet weak var btnUpload: UIButton!
    
    
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


// MARK: - UIImagePickerControllerDelegate 相机相册
extension DetailController: UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        print(imagePickerController)
    }
    
    
    
    /// 上传图片
    /// [import MobileCoreServices]
    /// [UIImagePickerControllerDelegate]
    /// [UINavigationControllerDelegate]
    /// [func imagePickerController]
    /// - Parameter sender: sender description
    @IBAction func uploadAcion(_ sender: Any) {
        
        //指示设备是否支持使用指定的源类型选择媒体。
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("没有权限访问相机")
            return
        }
        // 获得相机模式下支持的媒体类型
        let availableMediaTypes: [String]? = UIImagePickerController.availableMediaTypes(for: .photoLibrary)
        if availableMediaTypes == nil {
            return
        }
        
        
        //let picker = UIImagePickerController(navigationBarClass: nil, toolbarClass: nil)
        let picker = UIImagePickerController(rootViewController: self)
        //picker.mediaTypes = [kUTTypeQuickTimeImage as String] //一个数组，指示媒体选择器控制器要访问的媒体类型
        picker.mediaTypes = (availableMediaTypes)!
        picker.delegate = self // 这句代码需要继承 UINavigationControllerDelegate
        picker.allowsEditing = false // replacement for -allowsImageEditing; default value is NO.
        picker.sourceType  = .photoLibrary
        
        //self.view.addSubview(picker.view)
        //self.show(picker, sender: nil)
        
        //self.view.addSubview(picker.view)
        //self.view.bringSubviewToFront(picker.view)
        self.present(picker, animated: true, completion: nil)
        
        
        guard UIImagePickerController.isCameraDeviceAvailable(.front) else {
            print("前端相机不可用")
            return
        }
    }
}

// MARK: - 保存
extension DetailController {
    
    
    /// 保存
    ///
    /// - Parameter sender: sender description
    @IBAction func actionAction(_ sender: Any) {
        area?.Address = txtAddress.text
        area?.Area = txtArea.text
        area?.Remark = txtRemark.text
    }
}

