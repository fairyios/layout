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
        
        let imageTop = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self.myContentView, attribute: .top, multiplier: 1, constant: 0)
        let imageBottom = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: self.myContentView, attribute: .bottom, multiplier: 1, constant: 0)
        let imageLeading = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.myContentView, attribute: .leading, multiplier: 1, constant: 0)
        let imageTrailing = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self.myContentView, attribute: .trailing, multiplier: 1, constant: 0)
        
        self.myContentView.addSubview(imageView)
        self.myContentView.addConstraints([imageTop, imageBottom, imageLeading, imageTrailing])
        
        
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
        
        
        let labelHeight = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let labelTop = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.myContentView, attribute: .top, multiplier: 1, constant: 0)
        //let labelBottom = NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem:  self.myContentView, attribute: .bottom, multiplier: 1, constant: 0)
        let labelLeading = NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem:  self.myContentView, attribute: .leading, multiplier: 1, constant: 0)
        let labelTrailing = NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem:  self.myContentView, attribute: .trailing, multiplier: 1, constant: 0)
        label.addConstraints([labelHeight])
        
        self.myContentView.addSubview(label)
        self.myContentView.addConstraints([labelTop, labelLeading, labelTrailing])
        
        return label
    }()
    
    lazy var myEffect: UIVisualEffectView! = {
        let effect = UIVisualEffectView()
        effect.translatesAutoresizingMaskIntoConstraints = false
        effect.backgroundColor =  ColorDefault.Theme
        effect.layer.cornerRadius = CGFloat(20)
        effect.clipsToBounds = true
        //effect.textColor = UIColor.red
        //effect.frame.size.width = CGFloat(50)
        //effect.frame.size.height = CGFloat(50)
        
        
        let effectHeight = NSLayoutConstraint(item: effect, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        let effectTop = NSLayoutConstraint(item: effect, attribute: .top, relatedBy: .equal, toItem: self.myContentView, attribute: .top, multiplier: 1, constant: 200)
        //let effectBottom = NSLayoutConstraint(item: effect, attribute: .bottom, relatedBy: .equal, toItem:  self.myContentView, attribute: .bottom, multiplier: 1, constant: 0)
        let effectLeading = NSLayoutConstraint(item: effect, attribute: .leading, relatedBy: .equal, toItem:  self.myContentView, attribute: .leading, multiplier: 1, constant: 0)
        let effectTrailing = NSLayoutConstraint(item: effect, attribute: .trailing, relatedBy: .equal, toItem:  self.myContentView, attribute: .trailing, multiplier: 1, constant: 0)
        effect.addConstraints([effectHeight])
        
        self.myContentView.addSubview(effect)
        self.myContentView.addConstraints([effectTop, effectLeading, effectTrailing])
        
        return effect
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
        
        
        let myContentViewWidth = NSLayoutConstraint(item: contentView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        let myContentViewHeight = NSLayoutConstraint(item: contentView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(self.rowHeightCell - 40))
        let myContentViewCenterX = NSLayoutConstraint(item: contentView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let myContentViewCenterY = NSLayoutConstraint(item: contentView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        contentView.addConstraints([myContentViewWidth, myContentViewHeight])
        self.addSubview(contentView)
        self.addConstraints([myContentViewCenterX, myContentViewCenterY])
        //self.prepareForReuse()
        //self.sizeToFit()
        
        return contentView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //print(String(describing: QianTableCell.self))
        //print(String(describing: self.myImageView))
        
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        let _ = self.myImageView
        let _ = self.myEffect
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
