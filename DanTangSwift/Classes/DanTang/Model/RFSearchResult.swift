//
//  RFSearchResult.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/17.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFSearchResult: NSObject {
    var favorites_count: Int?
    var likes_count: Int?
    var id: Int?
    var price: String?
    var liked: Bool?
    var cover_image_url: String?
    var describe: String?
    var name: String?

    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        favorites_count = dict["favorites_count"] as? Int
        price = dict["price"] as? String
        liked = dict["liked"] as? Bool
        cover_image_url = dict["cover_image_url"] as? String
        describe = dict["description"] as? String
    }
}



























