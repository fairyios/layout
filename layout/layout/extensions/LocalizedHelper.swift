//
//  LocalizeString.swift
//  layout
//
//  Created by Fairy on 2018/10/31.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation
import UIKit


/// 本地化翻译
final class LocalizedHelper {
    /// 取消
    static var Cancel: String {
        get {
            return Transtalion("Cancel", failedValue: "取消2")
        }
    }
    
    /// 删除
    static var Delete: String {
        get {
            return Transtalion("Delete", failedValue: "删除2")
        }
    }
    
    /// 分享
    static var Share: String {
        get {
            return Transtalion("Share", failedValue: "分享2")
        }
    }
    
    
    /// // 使用key翻译不成功就会返回value的值
    ///
    /// - Parameters:
    ///   - key: key description
    ///   - failedValue: failedValue description
    ///   - remark: remark description
    /// - Returns: return value description
    private static func Transtalion (_ key: String, failedValue: String, remark: String = "")
        -> String {
        return NSLocalizedString(key,
                                 bundle: Bundle(for: UIButton.classForCoder()),
                                 value: failedValue,
                                 comment: remark)
    }
}


    
    

    
    


