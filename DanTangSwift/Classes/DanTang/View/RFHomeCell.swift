//
//  RFHomeCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/16.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher

protocol RFHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickFavoriteButton(button: UIButton)
}

class RFHomeCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBOutlet weak var placeholderBtn: UIButton!
    
    weak var delegate:RFHomeCellDelegate?
    
    var homeItem: RFHomeItem? {
        didSet{
            // 背景图片赋值
            let url = homeItem!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " " , forState: .Normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        // 定义下面两个属性来提高圆角效率
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
        
    }

    // 点击喜欢按钮
    @IBAction func favoriteBtnClick(sender: UIButton) {
        delegate?.homeCellDidClickFavoriteButton(sender)
    }
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
