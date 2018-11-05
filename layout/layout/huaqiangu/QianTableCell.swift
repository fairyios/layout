//
//  QianTableCell.swift
//  layout
//
//  Created by Fairy on 2018/11/2.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

/// QianTableCell|自定义单元格
final class QianTableCell : UITableViewCell {
    
    public static let rowHeight: CGFloat = CGFloat(500)
    let rowHeightCell = rowHeight
    
    
    
    /// 图片【UIImageView 设置圆角“imageView.clipsToBounds = true”后阴影效果会消失】
    lazy var myImageView: UIImageView! = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "huaqiangu_logo_600x600iPadPortraitiOS56_768x1024pt"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = CGFloat(20)
        imageView.clipsToBounds = true//设置为true，阴影失效
        
        
        return imageView
    }()
    
    lazy var myLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = ColorDefault.Theme
        label.layer.cornerRadius = CGFloat(20)
        label.clipsToBounds = true
        //label.textColor = UIColor.red
        //label.frame.size.width = CGFloat(50)
        //label.frame.size.height = CGFloat(50)
        label.text = "花v千骨vv花v千骨vv"
        return label
    }()
    
    lazy var myContentView: UIView! = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.orange
        contentView.layer.cornerRadius = 20
        //contentView.clipsToBounds = true
        
        contentView.layer.borderWidth = CGFloat(1.0)
        contentView.layer.borderColor = ColorDefault.Theme.cgColor
        contentView.layer.shadowColor = ColorDefault.Theme.cgColor// ColorDefault.Theme.cgColor// UIColor.red.cgColor
        contentView.layer.shadowRadius = CGFloat(15)
        contentView.layer.shadowOpacity = 1.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        //contentView.layer.shadowPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 5).cgPath
        //contentView.layer.contents = UIScreen.main.scale
        
        return contentView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print(String(describing: QianTableCell.self))
        //print(String(describing: self.myImageView))
        
        self.myContentView.addSubview(self.myImageView)
        self.myContentView.addSubview(self.myLabel)
        self.addSubview(self.myContentView)
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
//        let imageViewConstraintWidth = NSLayoutConstraint(item: self.myImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
//        let imageViewConstraintHeight = NSLayoutConstraint(item: self.myImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
//        self.myImageView.addConstraints([imageViewConstraintWidth, imageViewConstraintHeight])
        
        let imageTop = NSLayoutConstraint(item: self.myImageView, attribute: .top, relatedBy: .equal, toItem: self.myContentView, attribute: .top, multiplier: 1, constant: 0)
        let imageBottom = NSLayoutConstraint(item: self.myImageView, attribute: .bottom, relatedBy: .equal, toItem: self.myContentView, attribute: .bottom, multiplier: 1, constant: 0)
        let imageLeading = NSLayoutConstraint(item: self.myImageView, attribute: .leading, relatedBy: .equal, toItem: self.myContentView, attribute: .leading, multiplier: 1, constant: 0)
        let imageTrailing = NSLayoutConstraint(item: self.myImageView, attribute: .trailing, relatedBy: .equal, toItem: self.myContentView, attribute: .trailing, multiplier: 1, constant: 0)
        self.myContentView.addConstraints([imageTop, imageBottom, imageLeading, imageTrailing])
        
        
        let labelHeight = NSLayoutConstraint(item: self.myLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        self.myLabel.addConstraints([labelHeight])
        
        let labelTop = NSLayoutConstraint(item: self.myLabel, attribute: .top, relatedBy: .equal, toItem: self.myContentView, attribute: .top, multiplier: 1, constant: 0)
        //let labelBottom = NSLayoutConstraint(item: self.myLabel, attribute: .bottom, relatedBy: .equal, toItem:  self.myContentView, attribute: .bottom, multiplier: 1, constant: 0)
        let labelLeading = NSLayoutConstraint(item: self.myLabel, attribute: .leading, relatedBy: .equal, toItem:  self.myContentView, attribute: .leading, multiplier: 1, constant: 0)
        let labelTrailing = NSLayoutConstraint(item: self.myLabel, attribute: .trailing, relatedBy: .equal, toItem:  self.myContentView, attribute: .trailing, multiplier: 1, constant: 0)
        self.myContentView.addConstraints([labelTop, labelLeading, labelTrailing])
        
        
//        let stackLeading = NSLayoutConstraint(item: self.myStack, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 50)
//        let stackTrailing = NSLayoutConstraint(item: self.myStack, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -50)
//        let stackTop = NSLayoutConstraint(item: self.myStack, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
//        let stackButtom = NSLayoutConstraint(item: self.myStack, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -20)
//        self.addConstraints([stackLeading, stackTrailing, stackTop, stackButtom])
//        //self.prepareForReuse()
//        //self.sizeToFit()

        let stackWidth = NSLayoutConstraint(item: self.myContentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let stackHeight = NSLayoutConstraint(item: self.myContentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(self.rowHeightCell - 40))
        let stackCenterX = NSLayoutConstraint(item: self.myContentView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let stackCenterY = NSLayoutConstraint(item: self.myContentView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.myContentView.addConstraints([stackWidth, stackHeight])
        self.addConstraints([stackCenterX, stackCenterY])
        //self.prepareForReuse()
        //self.sizeToFit()
  
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
