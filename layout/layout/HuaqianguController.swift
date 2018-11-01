//
//  HuaqianguController.swift
//  layout
//
//  Created by Fairy on 2018/11/1.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


// HuaqianguController
final class HuaqianguController: UIViewController {
    
    let rowHeight: CGFloat = CGFloat(80)
    let reuseableCellName: String = "reuseableCell"
    var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func initTableView() {
        self.table = UITableView()
        self.table.rowHeight = rowHeight
        //self.table.isUserInteractionEnabled = false //点击不变背景颜色,不能滚动
        self.table.backgroundColor = UIColor.clear
        self.table.frame = self.view.frame
        self.table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.table.separatorColor = UIColor.orange
        self.table.separatorStyle = .singleLine
        self.table.dataSource = self
        self.table.delegate = self
        //self.table.register(UINib(nibName: "UITableViewCellFairy", bundle: nil), forCellReuseIdentifier: "Nib")
        //self.table.register(UITableViewCellFairy.self, forCellReuseIdentifier: self.reuseableCellName)
        self.table.register(UITableViewCellFairy.classForCoder(), forCellReuseIdentifier: self.reuseableCellName)
        
        self.view.addSubview(self.table)
        
        //self.table.sizeToFit()//调整接收器视图的大小并移动它，使其只包含其子视图
    }
}


// MARK: - UITableViewDataSource
extension HuaqianguController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseableCellName) as? UITableViewCellFairy
        if (cell == nil) {
            cell = UITableViewCellFairy(style: .default, reuseIdentifier: self.reuseableCellName)
        }
        return cell!
    }
    
    
}


// MARK: - UITableViewDelegate
extension HuaqianguController: UITableViewDelegate {
    
}


/// UITableViewCellFairy|自定义单元格
final class UITableViewCellFairy : UITableViewCell {
    
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
        
        print(String(describing: UITableViewCellFairy.self))
        print(String(describing: self.myImageView))
        
        self.myStack.addSubview(self.myImageView)
        self.myStack.addSubview(self.myLabel)
        self.addSubview(self.myStack)
        self.backgroundColor = UIColor.clear
        
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

