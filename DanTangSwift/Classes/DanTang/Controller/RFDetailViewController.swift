//
//  RFDetailViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/17.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import SVProgressHUD

class RFDetailViewController: RFBaseViewController, UIWebViewDelegate {

    var homeItem: RFHomeItem?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView()
        webView.frame = view.bounds
        // 页面自适应屏幕大小
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        let url = NSURL(string: homeItem!.content_url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true // 显示联网标记
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        SVProgressHUD.dismiss()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
