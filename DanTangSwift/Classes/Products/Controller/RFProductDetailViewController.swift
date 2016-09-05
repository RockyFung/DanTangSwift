//
//  RFProductDetailViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/22.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import SnapKit

class RFProductDetailViewController: RFBaseViewController {

    var product: RFProduct?
    var result: RFSearchResult?
    var type = String()
    
    // 懒加载
    private lazy var scrollView: RFDetailScrollView = {
       let scrollView = RFDetailScrollView()
        scrollView.showsHorizontalScrollIndicator = false
//        scrollView.delegate = self
        return scrollView
    }()
    
    // 底部栏
    private lazy var toolBarView: RFProductDetailToolBar = {
       let toolBarView = NSBundle.mainBundle().loadNibNamed(String(RFProductDetailToolBar), owner: nil, options: nil).last as! RFProductDetailToolBar
        toolBarView.delegate = self
        return toolBarView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // 设置导航栏和底部蓝
    func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .Plain, target: self, action: #selector(shareBBItemClick))
        view.addSubview(scrollView)
        // 添加底部栏
        view.addSubview(toolBarView)
        
        
        scrollView.product = product
        scrollView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.bottom.equalTo(toolBarView.snp_top)
        }
       
        
        
        toolBarView.snp_makeConstraints { (make) in
            make.left.bottom.right.equalTo(view)
            make.height.equalTo(45)
        }
        
         scrollView.contentSize = CGSizeMake(SCREENW, SCREENH - 64 - 45 + kMargin + 520)
        
    }
    
    // 分享按钮
    func shareBBItemClick(){
        print("点击分享！！！！")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RFProductDetailViewController: RFProductDetailToolBarDelegate, UIScrollViewDelegate{
    // 点击底部天猫按钮
    func toolBarDidClickedTMALLButton() {
        let tmallVC = RFTMALLViewController()
        tmallVC.product = product
        tmallVC.title = "商品详情"
        let nav = RFNavigationController(rootViewController: tmallVC)
        presentViewController(nav, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offsetY = scrollView.contentOffset.y
        if offsetY >= 465{
            offsetY = CGFloat(465)
            scrollView.contentOffset = CGPointMake(0, offsetY)
        }
    }
}












