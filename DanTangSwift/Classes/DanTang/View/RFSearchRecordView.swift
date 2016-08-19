//
//  RFSearchRecordView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/17.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFSearchRecordView: UIView {
    // 关键词
    var words = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 搜索界面数据获取热搜关键词
        weak var weakSelf = self
        RFNetworkTool.shareNetworkTool.loadHotWords { (words) in
            weakSelf!.words = words
            weakSelf?.setupUI()
        }
    }
    
    func setupUI(){
        // 大家都在搜
        let topView = UIView()
        addSubview(topView)
        let hotLabel = setupLabel("大家都在搜")
        hotLabel.frame = CGRectMake(10, 20, 200, 20)
        topView.addSubview(hotLabel)
        
        // 历史记录
        let bottomView = UIView()
        addSubview(bottomView)
    }
    
    func setupLabel(title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFontOfSize(12)
        label.textColor = RFColor(0, g: 0, b: 0, a: 0.6)
        return label
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
}


































