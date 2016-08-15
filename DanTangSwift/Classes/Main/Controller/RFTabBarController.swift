//
//  RFTabBarController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/10.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        
        // 添加子控制器
        addChildViewControllers()
    }

    
    
    private func addChildViewControllers() {
        let titles : Array<String> = ["单糖","单品","分类","我"]
        let controllers : Array<String> = ["RFDanTangViewController", "RFProductViewController", "RFCategoryViewController", "RFMeViewController"]
        let imageNameds : Array<String> = ["TabBar_home_23x23_","TabBar_gift_23x23_","TabBar_category_23x23_","TabBar_me_boy_23x23_"]
        
        
        for (index, value) in titles.enumerate() {
            addChildViewController(controllers[index], title: value, imageName: imageNameds[index], selectImageName: imageNameds[index] + "selected")
        }
    }

    /**
     # 初始化子控制器
     
     - parameter childControllerName: 需要初始化的控制器
     - parameter title:               标题
     - parameter imageName:           图片名称
     */
    
    private func addChildViewController(childControllerName:String, title:String, imageName:String, selectImageName:String) {
        
        // 动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"]as!String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        let cls = NSClassFromString(ns + "." + childControllerName) as! UIViewController.Type
        let vc = cls.init()
        
        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: selectImageName)
        vc.title = title
        
        // 给每个控制器包装一个导航控制器
        let nav = RFNavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
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
