//
//  SpinnerController.swift
//  layout
//
//  Created by Fairy on 2018/10/31.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

final class ConstraintController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let spinner = UIActivityIndicatorView()
        //spinner.frame.size.width = CGFloat(50)
        //spinner.frame.size.height = CGFloat(50)
        spinner.backgroundColor = UIColor.yellow
        spinner.tintColor = UIColor.red
        spinner.isHidden = false
        spinner.hidesWhenStopped = true
        spinner.style = .gray
        spinner.startAnimating()
        //没有关闭且在“self.view.addSubview(spinner)”前“spinner.addConstraint(width)”会异常
        spinner.translatesAutoresizingMaskIntoConstraints = false
        //width.isActive 会被 “spinner.addConstraint(width)” 设置为true
        //Swfit2.3中使用width.active = true 而Swift3.0中是addConstraint(w)，并且attribute的值也不同
        let width = NSLayoutConstraint(item: spinner, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let height = NSLayoutConstraint(item: spinner, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        spinner.addConstraints([width, height])
        
        let centerX = NSLayoutConstraint(item: spinner, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 20)
        let centerY = NSLayoutConstraint(item: spinner, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 20)
        //先“self.view.addSubview(spinner)”在“self.view.addConstraints([leading])”，这样"self.view.backgroundColor"才不会无效
        self.view.addSubview(spinner)
        self.view.addConstraints([centerX, centerY])
        self.view.backgroundColor = UIColor.orange
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
