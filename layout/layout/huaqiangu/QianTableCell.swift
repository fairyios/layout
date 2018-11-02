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
    
    public static let rowHeight: CGFloat = CGFloat(400)
    let rowHeightCell = rowHeight
    
    lazy var myImageView: UIImageView! = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "huaqiangu_logo_600x600iPadPortraitiOS56_768x1024pt"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = CGFloat(30)
        //imageView.clipsToBounds = true
        
        imageView.layer.borderWidth = CGFloat(1.0)
        imageView.layer.borderColor = UIColor.orange.cgColor
        imageView.layer.shadowColor = UIColor.black.cgColor// UIColor.red.cgColor
        imageView.layer.shadowRadius = CGFloat(1)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        //imageView.layer.shadowPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: 5).cgPath
        //imageView.layer.contents = UIScreen.main.scale
        
        
        return imageView
    }()
    
    lazy var myLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.orange
        //label.textColor = UIColor.red
        //label.frame.size.width = CGFloat(50)
        //label.frame.size.height = CGFloat(50)
        label.text = "花v千骨vv花v千骨vv"
        return label
    }()
    
    lazy var myStack: UIStackView! = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fill
        stack.alignment = .leading
        //stack.spacing = CGFloat(10)
        
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        print(String(describing: QianTableCell.self))
        //print(String(describing: self.myImageView))
        
        self.myStack.addSubview(self.myLabel)
        self.myStack.addSubview(self.myImageView)
        self.addSubview(self.myStack)
        self.backgroundColor = UIColor.white
        
//        let imageViewConstraintWidth = NSLayoutConstraint(item: self.myImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
//        let imageViewConstraintHeight = NSLayoutConstraint(item: self.myImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
//        self.myImageView.addConstraints([imageViewConstraintWidth, imageViewConstraintHeight])
        
        //let imageCenterY = NSLayoutConstraint(item: self.myImageView, attribute: .centerY, relatedBy: .equal, toItem: self.myStack, attribute: .centerY, multiplier: 1, constant: 0)
        let imageTop = NSLayoutConstraint(item: self.myImageView, attribute: .top, relatedBy: .equal, toItem: self.myStack, attribute: .top, multiplier: 1, constant: 50)
        let imageBottom = NSLayoutConstraint(item: self.myImageView, attribute: .bottom, relatedBy: .equal, toItem: self.myStack, attribute: .bottom, multiplier: 1, constant: 0)
        let imageLeading = NSLayoutConstraint(item: self.myImageView, attribute: .leading, relatedBy: .equal, toItem: self.myStack, attribute: .leading, multiplier: 1, constant: 0)
        let imageTrailing = NSLayoutConstraint(item: self.myImageView, attribute: .trailing, relatedBy: .equal, toItem: self.myStack, attribute: .trailing, multiplier: 1, constant: 0)
        self.myStack.addConstraints([imageTop, imageBottom, imageLeading, imageTrailing])
        
        
        let labelHeight = NSLayoutConstraint(item: self.myLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        self.myLabel.addConstraints([labelHeight])
        
        let labelTop = NSLayoutConstraint(item: self.myLabel, attribute: .top, relatedBy: .equal, toItem: self.myStack, attribute: .top, multiplier: 1, constant: 0)
        //let labelBottom = NSLayoutConstraint(item: self.myLabel, attribute: .bottom, relatedBy: .equal, toItem:  self.myStack, attribute: .bottom, multiplier: 1, constant: 0)
        let labelLeading = NSLayoutConstraint(item: self.myLabel, attribute: .leading, relatedBy: .equal, toItem:  self.myStack, attribute: .leading, multiplier: 1, constant: 0)
        let labelTrailing = NSLayoutConstraint(item: self.myLabel, attribute: .trailing, relatedBy: .equal, toItem:  self.myStack, attribute: .trailing, multiplier: 1, constant: 0)
        self.myStack.addConstraints([labelTop, labelLeading, labelTrailing])
        
        
//        let stackLeading = NSLayoutConstraint(item: self.myStack, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 50)
//        let stackTrailing = NSLayoutConstraint(item: self.myStack, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -50)
//        let stackTop = NSLayoutConstraint(item: self.myStack, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 20)
//        let stackButtom = NSLayoutConstraint(item: self.myStack, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -20)
//        self.addConstraints([stackLeading, stackTrailing, stackTop, stackButtom])
//        //self.prepareForReuse()
//        //self.sizeToFit()

        let stackWidth = NSLayoutConstraint(item: self.myStack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        let stackHeight = NSLayoutConstraint(item: self.myStack, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: CGFloat(self.rowHeightCell - 40))
        let stackCenterX = NSLayoutConstraint(item: self.myStack, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let stackCenterY = NSLayoutConstraint(item: self.myStack, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        self.myStack.addConstraints([stackWidth, stackHeight])
        self.addConstraints([stackCenterX, stackCenterY])
        //self.prepareForReuse()
        //self.sizeToFit()
 
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
