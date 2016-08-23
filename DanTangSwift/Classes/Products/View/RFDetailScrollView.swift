//
//  RFDetailScrollView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/22.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFDetailScrollView: UIScrollView {

    // 顶部滚动视图
    private lazy var topScrollView: RFProductDetailTopView = {
       let topScrollView = RFProductDetailTopView()
        topScrollView.backgroundColor = UIColor.whiteColor()
        return topScrollView
    }()
    
    // 底部滚动视图
    private lazy var bottomScrollView: RFProdectDetailBottomView = {
       let bottomScrollView = RFProdectDetailBottomView()
        bottomScrollView.backgroundColor = UIColor.whiteColor()
        return bottomScrollView
    }()
    
    var product: RFProduct?{
        didSet{
            topScrollView.product = product
            bottomScrollView.product = product
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI(){
        // 添加顶部视图
        addSubview(topScrollView)
        topScrollView.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(self)
            make.size.equalTo(CGSizeMake(SCREENW, 520))
        }
        
        // 添加底部滚动视图
        addSubview(bottomScrollView)
        bottomScrollView.snp_makeConstraints { (make) in
            make.left.equalTo(self)
            make.top.equalTo(topScrollView.snp_bottom).offset(kMargin)
            make.size.equalTo(CGSizeMake(SCREENW, SCREENH - 64 - 45))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


















