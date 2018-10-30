//
//  DynamicPageController.swift
//  layout
//
//  Created by Fairy on 2018/10/30.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit


/// 动态引导页面
final class DynamicPageController: UIPageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UIPageViewControllerDataSource
extension DynamicPageController: UIPageViewControllerDataSource {
    
    
    /// 上一页
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController description
    ///   - viewController: viewController description
    /// - Returns: return value description
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController)
        -> UIViewController? {
        return nil
    }
    
    
    /// 下一页
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController description
    ///   - viewController: viewController description
    /// - Returns: return value description
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController)
        -> UIViewController? {
        return nil
    }
    
    
}
