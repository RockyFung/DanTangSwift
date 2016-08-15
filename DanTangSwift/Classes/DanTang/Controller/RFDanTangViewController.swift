//
//  RFDanTangViewController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/11.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFDanTangViewController: RFBaseViewController {
//    var channels = [RFChannel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏
        setupNav()
        
        // 获取顶部分类数据
        RFNetworkTool.shareNetworkTool.loadHomeTopData {[weak self] (rf_channels) in
            for channel in rf_channels{
                print(channel.name)
            }
            
        }
    }

    
    
    
    // 设置导航栏
    func setupNav(){
        view.backgroundColor = UIColor.whiteColor()
        let searchIcon = UIImage(named: "Feed_SearchBtn_18x18_")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: searchIcon, style: .Plain, target: self, action: #selector(clickSearchBtn))
        
    }
    
    
    func clickSearchBtn(){
        
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
