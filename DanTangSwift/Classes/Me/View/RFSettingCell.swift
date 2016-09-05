//
//  RFSettingCell.swift
//  DanTangSwift
//
//  Created by rocky on 16/9/2.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFSettingCell: UITableViewCell {

    var setting:RFSetting?{
        didSet{
            iconImageView.image = UIImage(named: setting!.iconImage!)
            leftLabel.text = setting!.leftTitle
            rightLabel.text = setting!.rightTitle
            disclosureIndicator.hidden = setting!.isHiddenRightTip!
            switchView.hidden = setting!.isHiddenSwitch!
        }
    }
    
    @IBOutlet weak var disclosureIndicator: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var iconImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
