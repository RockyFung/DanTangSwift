//
//  RFDetailChoiceButtonView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/23.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

protocol RFDetailChoiceButtonViewDelegate: NSObjectProtocol {
    func choiceIntroduceButtonClick()
    func choiceCommentButtonClick()
}


class RFDetailChoiceButtonView: UIView {

    weak var delegate: RFDetailChoiceButtonViewDelegate?
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    
    // 图文介绍按钮
    @IBAction func introduceButtonClick(sender: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) { 
            self.lineView.x = 0
        }
        delegate?.choiceIntroduceButtonClick()
    }
    
    // 评论按钮
    @IBAction func commentButtonClick(sender: UIButton) {
        UIView.animateWithDuration(kAnimationDuration) { 
            self.lineView.x = SCREENW * 0.5
        }
        delegate?.choiceCommentButtonClick()
    }
    
    class func choiceButtonView() -> RFDetailChoiceButtonView{
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! RFDetailChoiceButtonView
    }
    
}




















