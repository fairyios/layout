//
//  IosHelper.swift
//  layout
//
//  Created by Fairy on 2018/10/29.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation


/// 运行环境
struct Platform {
    static let isSimulator: Bool = {
        var isSim = false
        #if targetEnvironment(simulator) //#if (arch(i386) || arch(x86_64)) && os(iOS)
        isSim = true
        #endif
        return isSim
    }()
}

extension Array {
     
}
