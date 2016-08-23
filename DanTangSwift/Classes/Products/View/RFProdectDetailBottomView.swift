//
//  RFProdectDetailBottomView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/23.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import SnapKit

let commentCellID = "commentCellID"

class RFProdectDetailBottomView: UIView {
    var comments = [RFComment]()
    
    var product: RFProduct? {
        didSet{
            weak var weakSelf = self
            
            // 获取单品详细数据
            RFNetworkTool.shareNetworkTool.loadProductDetailData(product!.id!) { (productDetail) in
                weakSelf?.choiceButtonView.commentButton.setTitle("评论(\(productDetail.comments_count!))", forState: .Normal)
            }
            
            // 获取评论数据
            RFNetworkTool.shareNetworkTool.loadProductDetailComments(product!.id!) { (comments) in
                weakSelf?.comments = comments
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        // 添加两个选择按钮
        addSubview(choiceButtonView)
        choiceButtonView.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREENW, 44))
            make.top.equalTo(self)
        }
    }
    
    
    private lazy var choiceButtonView: RFDetailChoiceButtonView = {
       let choiceButtonView = RFDetailChoiceButtonView.choiceButtonView()
        choiceButtonView.delegate = self
        return choiceButtonView
    }()

}


extension RFProdectDetailBottomView: RFDetailChoiceButtonViewDelegate{
    
    // RFDetailChoiceButtonViewDelegate
    func choiceCommentButtonClick() {
        
    }
    
    func choiceIntroduceButtonClick() {
        
    }
}


































