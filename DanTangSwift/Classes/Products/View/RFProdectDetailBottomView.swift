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
                weakSelf?.webView.loadHTMLString(productDetail.detail_html!, baseURL: nil)
            }
            
            // 获取评论数据
            RFNetworkTool.shareNetworkTool.loadProductDetailComments(product!.id!) { (comments) in
                weakSelf?.comments = comments
                weakSelf?.tableView.reloadData()
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
        
        
        // 添加评论
        addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp_bottom)
            make.left.right.bottom.equalTo(self)
        }
        
        
        // 添加图文介绍
        addSubview(webView)
        webView.snp_makeConstraints { (make) in
            make.top.equalTo(choiceButtonView.snp_bottom)
            make.left.right.bottom.equalTo(self)
        }
        

        
    }
    
    
    private lazy var choiceButtonView: RFDetailChoiceButtonView = {
       let choiceButtonView = RFDetailChoiceButtonView.choiceButtonView()
        choiceButtonView.delegate = self
        return choiceButtonView
    }()
    
    private lazy var webView: UIWebView = {
       let webView = UIWebView()
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        webView.delegate = self
        return webView
    }()
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        let nib = UINib(nibName: String(RFCommentCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: commentCellID)
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.rowHeight = 64
        return tableView
    }()

}


extension RFProdectDetailBottomView: RFDetailChoiceButtonViewDelegate, UITableViewDataSource, UIWebViewDelegate{
    
    // RFDetailChoiceButtonViewDelegate
    func choiceCommentButtonClick() {
        tableView.hidden = false
        webView.hidden = true
    }
    
    func choiceIntroduceButtonClick() {
        tableView.hidden = true
        webView.hidden = false
    }
    
    // MARK: - UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(commentCellID, forIndexPath: indexPath) as! RFCommentCell
        cell.comment = comments[indexPath.row]
        return cell
    }
    
}


































