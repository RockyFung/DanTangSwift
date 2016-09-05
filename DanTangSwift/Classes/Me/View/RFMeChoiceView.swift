//
//  RFMeChoiceView.swift
//  DanTangSwift
//
//  Created by rocky on 16/9/2.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import Kingfisher

protocol RFMeChoiceViewDelegate:NSObjectProtocol {
    func clickChoiceViewButton(button: UIButton)
}

class RFMeChoiceView: UIView {
    
    weak var delegate: RFMeChoiceViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    private func setupUI(){
        // 左边的按钮
        addSubview(leftButton)
        // 右边的按钮
        addSubview(rightButton)
        // 底部红色条
        addSubview(indicatorView)
        
        leftButton.snp_makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.width.equalTo(rightButton)
        }
        
        rightButton.snp_makeConstraints { (make) in
            make.left.equalTo(leftButton.snp_right)
            make.top.right.bottom.equalTo(self)
        }
        
        indicatorView.snp_makeConstraints { (make) in
            make.height.equalTo(2.0)
            make.bottom.left.equalTo(self)
            make.right.equalTo(leftButton)
        }

    }
    // 左边按钮
    private lazy var leftButton: UIButton = {
       let leftButton = UIButton()
        leftButton.setTitle("喜欢的商品", forState: .Normal)
        leftButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        leftButton.setTitleColor(RFColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
        leftButton.backgroundColor = UIColor.whiteColor()
        leftButton.layer.borderColor = RFColor(230, g: 230, b: 230, a: 1.0).CGColor
        leftButton.layer.borderWidth = klineWidth
        leftButton.selected = true
        leftButton.addTarget(self, action: #selector(leftButtonClick(_:)), forControlEvents: .TouchUpInside)
        leftButton.tag = 1000
        return leftButton
    }()
    
    /// 右边的按钮
    private lazy var rightButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitle("喜欢的专题", forState: .Normal)
        rightButton.setTitleColor(RFColor(0, g: 0, b: 0, a: 0.7), forState: .Normal)
        rightButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        rightButton.backgroundColor = UIColor.whiteColor()
        rightButton.addTarget(self, action: #selector(rightButtonClick(_:)), forControlEvents: .TouchUpInside)
        rightButton.layer.borderColor = RFColor(230, g: 230, b: 230, a: 1.0).CGColor
        rightButton.layer.borderWidth = klineWidth
        rightButton.tag = 1001
        return rightButton
    }()
    
    /// 底部红色条
    private lazy var indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = RFGlobalRedColor()
        return indicatorView
    }()
    
    func leftButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = 0
        }
         delegate?.clickChoiceViewButton(button)
    }
    
    func rightButtonClick(button: UIButton) {
        button.selected = !button.selected
        UIView.animateWithDuration(kAnimationDuration) {
            self.indicatorView.x = SCREENW * 0.5
        }
        delegate?.clickChoiceViewButton(button)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}























