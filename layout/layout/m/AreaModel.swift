//
//  AreaModel.swift
//  layout
//
//  Created by Fairy on 2018/10/26.
//  Copyright © 2018 fairyios. All rights reserved.
//

import Foundation

struct AreaModel {
    var Image: String!
    var Address: String!
    var Area: String!
    var Remark: String!
    
    init(image: String,address: String, area: String, remark: String) {
        self.Image = image
        self.Address = address
        self.Area = area
        self.Remark = remark
    }
    
    ///
    ///
    /// - Parameter empty: empty description
    init() {
        self.init(image: "",address: "", area: "", remark: "")
    }
    
    /// struct 不能使用convenience
    ///
    /// - Parameter empty: empty description
    init(empty: Bool) {
        self.init(image: "",address: "", area: "", remark: "")
    }
    
    
    // class 使用
    // /// 通过在初始化器前声明convenience关键字可以声明一个便利初始化器，
    /// 它的作用是方便创建对象时使用，但它必须直接或间接调用专门初始化器
    
}

extension AreaModel {
    
    
    /// 获取示例列表
    ///
    /// - Returns: return value description
    public static func getDemos() -> [AreaModel] {
        
        let m01 = AreaModel(image: "xinzhuang", address: "1地址地址地址地址地址地址地址地址地址地址地址", area: "1区域", remark: "1备注")
        let m02 = AreaModel(image: "qilihe", address: "2地址sdf", area: "2区域", remark: "2备注")
        let m03 = AreaModel(image: "youxi", address: "3地址gsd", area: "3区域", remark: "3备注")
        let m04 = AreaModel(image: "chengxi", address: "4地址的方式", area: "4区域", remark: "4备注")
        let m05 = AreaModel(image: "baiyun", address: "5还认识多少分地址", area: "5区域", remark: "5备注")
        let m06 = AreaModel(image: "shangjie", address: "6股厄特我3的时光市大跌地址", area: "6区域", remark: "6备注")
        let m07 = AreaModel(image: "nangang", address: "7hu但是rry地址", area: "7区域", remark: "7备注")
        let m08 = AreaModel(image: "yaodu", address: "8就打电话地的分身乏术的饭额我分身乏术的址", area: "8区域", remark: "8备注")
        let m09 = AreaModel(image: "wuhou", address: "9客套话地址", area: "9区域", remark: "9备注")
        let m10 = AreaModel(image: "jinping", address: "10复古风蛋糕地址", area: "10区域", remark: "备注")
        let m11 = AreaModel(image: "furong", address: "11的恶果树大根深个二号地址", area: "11区域", remark: "备注")
        let areas: [AreaModel] = [m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11]
        return areas
    }
}
