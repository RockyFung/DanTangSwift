//
//  RFNavigationController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/10.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import SVProgressHUD

class RFNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏标题
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = RFGlobalRedColor()
        navBar.tintColor = UIColor.whiteColor()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:UIFont.systemFontOfSize(20)]
    }
    
    /**
     # 统一所有控制器导航栏左上角的返回按钮
     # 让所有push进来的控制器，它的导航栏左上角的内容都一样
     # 能拦截所有的push操作
     - parameter viewController: 需要压栈的控制器
     - parameter animated:       是否动画
     */
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        // 这是push进来的控制器，不是第一个自控制器
        if viewControllers.count > 0 {
            // push后隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            let leftBtn = UIBarButtonItem(title: "",style: .Plain, target: self, action: #selector(navigationBackClick))
            leftBtn.image = UIImage(named: "checkUserType_backward_9x15_")
            viewController.navigationItem.leftBarButtonItem = leftBtn
        }
    }
    
    
    // 返回按钮
    func navigationBackClick(){
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        if UIApplication.sharedApplication().networkActivityIndicatorVisible {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
        popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
