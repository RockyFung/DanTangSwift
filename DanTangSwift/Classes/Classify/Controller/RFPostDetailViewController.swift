//
//  RFPostDetailViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/30.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFPostDetailViewController: RFBaseViewController {

    
    var post: RFCollectionPost?

    override func viewDidLoad() {
        super.viewDidLoad()

        let webView = UIWebView()
        webView.frame = CGRectMake(0, 0, SCREENW, SCREENH)
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .All
        webView.delegate = self
        let url = NSURL(string: post!.content_url!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RFPostDetailViewController: UIWebViewDelegate{
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        print(webView.stringByEvaluatingJavaScriptFromString("document.documentElement.innerHTML"))
    }
}














