//
//  RFChannel.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/12.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFChannel: NSObject {
    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String:AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
}
