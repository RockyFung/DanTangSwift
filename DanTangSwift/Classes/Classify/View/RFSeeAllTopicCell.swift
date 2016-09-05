//
//  RFSeeAllTopicCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/26.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher


class RFSeeAllTopicCell: UITableViewCell {

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var placeholderButton: UIButton!
    
    var collection: RFCollection?{
        didSet{
            let url = collection!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderButton.hidden = true
            }
            titleLabel.text = collection!.title
            subtitleLabel.text = collection!.subtitle
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




















