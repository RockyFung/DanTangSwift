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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // 设置导航栏和底部蓝
    func setupUI(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "GiftShare_icon_18x22_"), style: .Plain, target: self, action: #selector(shareBBItemClick))
        view.addSubview(scrollView)
        scrollView.product = product
        scrollView.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(view)
            make.height.equalTo(600)
        }
        scrollView.contentSize = CGSizeMake(SCREENW, SCREENH - 64 - 45 + kMargin + 520)
        // 添加底部栏
        
    }
    
    // 分享按钮
    func shareBBItemClick(){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
