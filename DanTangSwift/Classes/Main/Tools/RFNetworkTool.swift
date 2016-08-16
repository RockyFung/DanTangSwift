//
//  RFNetworkTool.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/12.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON


class RFNetworkTool: NSObject {

    // 单例
    static let shareNetworkTool = RFNetworkTool()
    
    // 获取首页顶部分类数据
    func loadHomeTopData(finished: (rf_channels: [RFChannel]) -> ()){
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender":1,
                     "generation":1]
       Alamofire
        .request(.GET, url, parameters: params)
        .responseJSON{response in
            guard response.result.isSuccess else{
                SVProgressHUD.showErrorWithStatus("加载失败。。。")
                return
            }
            
            if let value = response.result.value{
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else{
                    SVProgressHUD.showInfoWithStatus(message)
                    return
                }
                SVProgressHUD.dismiss()
                
                let data = dict["data"].dictionary
                if let channels = data!["channels"]?.arrayObject{
                    var rf_channels = [RFChannel]()
                    for channel in channels{
                        let rf_channel = RFChannel(dict:channel as! [String: AnyObject])
                        rf_channels.append(rf_channel)
                    }
                    finished(rf_channels:rf_channels)
                }
            }
            
        }
        
    }
    
    
    // 获取首页数据
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}




































