//
//  RFCategoryViewController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/11.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFCategoryViewController: RFBaseViewController {

    
    // 创建大的scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.scrollEnabled = true
        scrollView.backgroundColor = RFGlobalColor()
        scrollView.frame = CGRectMake(0, 0, SCREENW, SCREENH)
        return scrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 搜索按钮
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(categoryRightBBClick))
        
        setupScrollView()
    }

    // 底部大的scrollView设置
    private func setupScrollView(){
        view.addSubview(scrollView)
        
        // 顶部控制器
        let headerViewController = RFCategoryHeaderViewController()
        addChildViewController(headerViewController)
        
        // 添加顶部控制器背景视图
        let topBGView = UIView(frame: CGRectMake(0, 0, SCREENW, 135))
        scrollView.addSubview(topBGView)
        topBGView.addSubview(headerViewController.view)
        
        // 添加底部风格品类
        let bottomBGView = RFCategoryBottomView()
        bottomBGView.frame = CGRectMake(0, CGRectGetMaxY(topBGView.frame) + 10, SCREENW, SCREENH - 160)
        bottomBGView.backgroundColor = RFGlobalColor()
        bottomBGView.delegate = self
        scrollView.addSubview(bottomBGView)
        scrollView.contentSize = CGSizeMake(SCREENW, CGRectGetMaxY(bottomBGView.frame))
    }
    
    
    func categoryRightBBClick() {
        let searchBarVC = RFSearchViewController()
        navigationController?.pushViewController(searchBarVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension RFCategoryViewController:RFCategoryBottomViewDelegate{
    func bottomviewButtonDidClicked(button: UIButton) {
        let collectionDetailVC = RFCollectionDetailController()
        collectionDetailVC.title = button.titleLabel?.text
        collectionDetailVC.id = button.tag
        collectionDetailVC.type = "风格品类"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
}





















