//
//  RFCollectionViewCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/19.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher

protocol RFCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCellDidClickLikeButton(button: UIButton)
}

class RFCollectionViewCell: UICollectionViewCell {

    weak var delegate: RFCollectionViewCellDelegate?
    
    @IBOutlet weak var placeholderBtn: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var result: RFSearchResult? {
        didSet {
            let url = result!.cover_image_url
            productImageView.kf_setImageWithURL(NSURL(string: url!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(result!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = result!.name
            priceLabel.text = "￥" + String(result!.price!)
        }
    }
    
    var product: RFProduct? {
        didSet {
            let url = product!.cover_image_url!
            productImageView.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            likeButton.setTitle(" " + String(product!.favorites_count!) + " ", forState: .Normal)
            titleLabel.text = product!.name
            priceLabel.text = "￥" + String(product!.price!)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func likeButtonClick(sender: UIButton) {
        delegate?.collectionViewCellDidClickLikeButton(sender)
    }
}


















