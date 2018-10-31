//
//  LocalSet.swift
//  layout
//
//  Created by Fairy on 2018/10/31.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation


final class LocalSet {
    

    /// 是否已显示过引导页面
    static var IsLaunched: Bool  {
        get {
            let value = UserDefaults.standard.bool(forKey: "IsLaunched")
            return value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "IsLaunched")
        }
    }
}
