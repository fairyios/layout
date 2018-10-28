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
    
}

extension RatingController {
    
    @IBAction func closeAction(_ sender: Any) {
        print("closeAction")
    }
    
//    @IBAction func closeRatingFrom(segue: UIStoryboardSegue) {
//        
//    }
}
