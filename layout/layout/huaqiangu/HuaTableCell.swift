//
//  HuaTableCell.swift
//  layout
//
//  Created by Fairy on 2018/11/2.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

/// HuaTableCell|自定义单元格
final class HuaTableCell : UITableViewCell {
    
    lazy var myImageView: UIImageView! = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "huaqiangu_logo_600x600iPhonePortraitiOS89_414x736pt"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = CGFloat(30)
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var myLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        //label.textColor = UIColor.red
        //label.frame.size.width = CGFloat(50)
        //label.frame.size.height = CGFloat(50)
        label.text = "klsdlsdjklfsdjl"
        return label
    }()
    
    lazy var myStack: UIStackView! = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = CGFloat(10)
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print(String(describing: HuaTableCell.self))
        print(String(describing: self.myImageView))
        
        self.myStack.addSubview(self.myImageView)
        self.myStack.addSubview(self.myLabel)
        self.addSubview(self.myStack)
        self.backgroundColor = UIColor.clear
        self.selectionStyle = .none
        
        let imageViewConstraintWidth = NSLayoutConstraint(item: self.myImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        let imageViewConstraintHeight = NSLayoutConstraint(item: self.myImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60)
        self.myImageView.addConstraints([imageViewConstraintWidth, imageViewConstraintHeight])
        
        //let imageCenterY = NSLayoutConstraint(item: self.myImageView, attribute: .centerY, relatedBy: .equal, toItem: self.myStack, attribute: .centerY, multiplier: 1, constant: 0)
        let imageTop = NSLayoutConstraint(item: self.myImageView, attribute: .top, relatedBy: .equal, toItem: self.myStack, attribute: .top, multiplier: 1, constant: 0)
        let imageBottom = NSLayoutConstraint(item: self.myImageView, attribute: .bottom, relatedBy: .equal, toItem: self.myStack, attribute: .bottom, multiplier: 1, constant: 0)
        let imageLeading = NSLayoutConstraint(item: self.myImageView, attribute: .leading, relatedBy: .equal, toItem: self.myStack, attribute: .leading, multiplier: 1, constant: 0)
        self.myStack.addConstraints([imageTop, imageBottom, imageLeading])
        
        let labelTop = NSLayoutConstraint(item: self.myLabel, attribute: .top, relatedBy: .equal, toItem: self.myStack, attribute: .top, multiplier: 1, constant: 10)
        let labelBottom = NSLayoutConstraint(item: self.myLabel, attribute: .bottom, relatedBy: .equal, toItem:  self.myStack, attribute: .bottom, multiplier: 1, constant: -10)
        let labelLeading = NSLayoutConstraint(item: self.myLabel, attribute: .leading, relatedBy: .equal, toItem:  self.myStack, attribute: .leading, multiplier: 1, constant: 80)
        let labelTrailing = NSLayoutConstraint(item: self.myLabel, attribute: .trailing, relatedBy: .equal, toItem:  self.myStack, attribute: .trailing, multiplier: 1, constant: -10)
        self.myStack.addConstraints([labelTop, labelBottom, labelLeading, labelTrailing])
        
        let stackLeading = NSLayoutConstraint(item: self.myStack, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10)
        let stackTrailing = NSLayoutConstraint(item: self.myStack, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10)
        let stackTop = NSLayoutConstraint(item: self.myStack, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10)
        let stackButtom = NSLayoutConstraint(item: self.myStack, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10)
        self.addConstraints([stackLeading, stackTrailing, stackTop, stackButtom])
        //self.prepareForReuse()
        //self.sizeToFit()
        
        print(self.myImageView.constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
