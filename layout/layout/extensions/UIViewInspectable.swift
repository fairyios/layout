//
//  UIViewInspectable.swift
//  layout
//
//  Created by Fairy on 2018/10/28.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit

extension UIView {
    
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return layer.borderColor == nil ? nil : UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    
    
    /// 圆角半径 (Clip to Bounds 需要打勾)
    @IBInspectable //IBInspectable 特性使得这个属性在main.sotryboard上可以显示的设置
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    /// 阴影透明度
    @IBInspectable
    var shadowOpacity : Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    
    
    /// 阴影半径
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    
    
    /// 阴影颜色
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            return layer.shadowColor == nil ? nil : UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    /// 阴影的偏移
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    
    
}

