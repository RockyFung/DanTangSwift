//
//  RFCategoryCollectionViewCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/30.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher


class RFCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var placeholderButton: UIButton!
    
    @IBOutlet weak var collectionImageView: UIImageView!
    
    var collection: RFCollection?{
        didSet{
            let url = collection!.banner_image_url
            collectionImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderButton.hidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
