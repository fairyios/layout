//
//  RatingController.swift
//  layout
//
//  Created by Fairy on 2018/10/28.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


/// 评论
class RatingController: UIViewController {
    
    var area: AreaModel!
    var rating: String! = ""
    
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView! //背景图片
    
    
    /// Description
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImage.image = UIImage(named: area.Image)
        
        let blurEffect = UIVisualEffectView(frame: self.view.frame)
        blurEffect.effect = UIBlurEffect(style: .regular)
        //blurEffect.addConstraints(self.backgroundImage.constraints) //constraints
        
        self.backgroundImage.addSubview(blurEffect)
        //self.backgroundImage.bringSubviewToFront(blurEffect)
    }
    
    
    /// Description
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /// 差评 - 转场返回
    ///
    /// - Parameter sender: sender description
    @IBAction func badRatingAction(_ sender: Any) {
        self.rating = "emoticons_dislike"
        performSegue(withIdentifier: "backDetailUnwind", sender: self)
    }
    
    
    /// 好评 - 转场返回
    ///
    /// - Parameter sender: sender description
    @IBAction func goodRatingAction(_ sender: Any) {
        self.rating = "emoticons_good"
        performSegue(withIdentifier: "backDetailUnwind", sender: self)
    }
    
    /// 超好评 - 转场返回
    ///
    /// - Parameter sender: sender description
    @IBAction func greatRatingAction(_ sender: Any) {
        self.rating = "emoticons_great"
        performSegue(withIdentifier: "backDetailUnwind", sender: self)
    }
}

extension RatingController {
    
    @IBAction func closeAction(_ sender: Any) {
        print("closeAction")
    }
    
//    @IBAction func closeRatingFrom(segue: UIStoryboardSegue) {
//
//    }
}
