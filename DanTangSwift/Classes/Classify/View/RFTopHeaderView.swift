//
//  RFTopHeaderView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/25.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

protocol RFTopHeaderViewDelegate: NSObjectProtocol {
    func topViewDidClickMoreButton(button: UIButton)
}

class RFTopHeaderView: UIView {

    @IBOutlet weak var button: UIButton!
    weak var delegate: RFTopHeaderViewDelegate?
    
    // 设置button的title和image的位置
    override func layoutSubviews() {
        super.layoutSubviews()
        let titleSize = button.imageView?.frame
        let iconW: CGFloat = 10
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -iconW, 0, iconW)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, CGRectGetMaxX(titleSize!) + 40, 0, -CGRectGetMaxX(titleSize!) - 40)

    }
    
    

    @IBAction func viewAllButton(sender: UIButton) {
        delegate?.topViewDidClickMoreButton(sender)
    }

}
