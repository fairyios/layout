//
//  DynamicPageController.swift
//  layout
//
//  Created by Fairy on 2018/10/30.
//  Copyright © 2018 fairyios. All rights reserved.
//

import UIKit



/// 第一页
final class UIViewControllerFirst :UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "wuhou")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.white
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}



/// 第二页
final class UIViewControllerSecond :UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = #imageLiteral(resourceName: "shangjie")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = UIColor.white
        imageView.frame = self.view.frame
        self.view.addSubview(imageView)
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


/// 动态引导页面
final class DynamicPageController: UIPageViewController {
    
    let first: UIViewControllerFirst! = UIViewControllerFirst()
    let second: UIViewControllerSecond! = UIViewControllerSecond()
    var pageControl: UIPageControl = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.pageControl.numberOfPages = 2
        self.pageControl.backgroundColor = UIColor.yellow
        //self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.orange
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.pageControl.hidesForSinglePage = false
        self.pageControl.frame.size.width = self.view.frame.size.width
        self.pageControl.frame.size.height = CGFloat(50)
        self.view.addSubview(self.pageControl) // 要在addSubview之后才能addConstraint
        
        
//        let cons = NSLayoutConstraint(item: self.pageControl, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
//        cons.isActive = true
//        self.view.addConstraint(cons)
        
        
        dataSource = self
        
        
        self.setViewControllers([self.first], direction: .forward, animated: true, completion: nil)
        //setViewControllers([second], direction: .forward, animated: true, completion: nil)
        self.pageControl.currentPage = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UIPageViewControllerDataSource
extension DynamicPageController: UIPageViewControllerDataSource {

// 自定义UIPageControl 时，不需要这2个func
//    /// 总共几页
//    ///
//    /// - Parameter pageViewController: pageViewController description
//    /// - Returns: return value description
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return 2
//    }
//
//
//    /// 起始页
//    ///
//    /// - Parameter pageViewController: pageViewController description
//    /// - Returns: return value description
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0 // 从0开始
//    }
    
    /// 上一页
    ///
    /// - Parameters:
    ///   - pageViewController: pageViewController description
    ///   - viewController: viewController description
    /// - Returns: return value description
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController)
        -> UIViewController? {
            print("上一页")
            
            guard self.pageControl.currentPage == 1 else { return nil}
            
            self.pageControl.currentPage = 0
            return self.first
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
            print("下一页")
            
//          let cons = NSLayoutConstraint(item: self.pageControl, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
//          cons.isActive = true
//          self.view.addConstraint(cons)
//
            guard self.pageControl.currentPage == 0 else { return nil}
            
            self.pageControl.currentPage = 1
            return self.second
    }
    
    
}
