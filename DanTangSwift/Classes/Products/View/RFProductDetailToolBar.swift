//
//  RFProductDetailToolBar.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/25.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

protocol RFProductDetailToolBarDelegate: NSObjectProtocol {
    func toolBarDidClickedTMALLButton()
}

class RFProductDetailToolBar: UIView {

    weak var delegate: RFProductDetailToolBarDelegate?
    
    @IBOutlet weak var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        likeButton.layer.borderColor = RFGlobalRedColor().CGColor
        likeButton.layer.borderWidth = klineWidth
        likeButton.setImage(UIImage(named: "content-details_like_16x16_"), forState: .Normal)
        likeButton.setImage(UIImage(named: "content-details_like_selected_16x16_"), forState: .Selected)
    }
    
    @IBAction func likeButtonClick(sender: UIButton) {
        // 判断是否登录
        if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            sender.selected = !sender.selected
        }else{
            let loginVC = RFLoginViewController()
            loginVC.title = "登录"
            let nav = RFNavigationController(rootViewController: loginVC)
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(nav, animated: true, completion: nil)
        }
    }
    

    @IBAction func goTMALLButtonClick(sender: UIButton) {
        delegate?.toolBarDidClickedTMALLButton()
    }
}





















