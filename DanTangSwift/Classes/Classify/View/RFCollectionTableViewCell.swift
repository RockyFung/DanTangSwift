//
//  RFCollectionTableViewCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/29.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher

class RFCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var placeholderButton: UIButton!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var collectionPost: RFCollectionPost?{
        didSet{
            let url = collectionPost!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderButton.hidden = true;
            }
            
            titleLabel.text = collectionPost!.title
            likeButton.setTitle("\(collectionPost!.likes_count!)", forState: .Normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}




























