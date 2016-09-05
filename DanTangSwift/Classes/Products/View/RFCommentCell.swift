//
//  RFCommentCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/24.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher

class RFCommentCell: UITableViewCell {

    var comment: RFComment? {
        didSet{
            let user = comment!.user
            let url = user!.avatar_url
            avatarImageView.kf_setImageWithURL(NSURL(string: url!))
            nicknameLabel.text = user!.nickname
            contentLabel.text = comment!.content
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
