//
//  RFSearchViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/17.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

let searchCollectionCellID = "searchCollectionCellID"

class RFSearchViewController: RFBaseViewController {

    var results = [RFSearchResult]()
    weak var collectionView: UICollectionView?
    
    // 懒加载
    private lazy var searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = "搜索商品、专辑"
        return searchBar
    }()
    
    private lazy var searchRecordView: RFSearchRecordView = {
        let searchRecordView = RFSearchRecordView()
        searchRecordView.backgroundColor = RFGlobalColor()
        searchRecordView.frame = CGRectMake(0, 64, SCREENW, SCREENH - 64)
        return searchRecordView
    }()
    
    private lazy var popView: RFSortTableView = {
       let popView = RFSortTableView()
        popView.delegate = self
        return popView
    }()
    
    // searchBar 键盘焦点设置
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        searchBar.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置导航栏
        setupNav()
        view.addSubview(searchRecordView)
    }
    
    
    // 设置导航栏
    func setupNav(){
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(navigationBackClick))
    }
    

    // 返回按钮
    func navigationBackClick(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    // 设置collectionView
    private func setupCollectView(){
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib(nibName: String(RFCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: searchCollectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        
    }
    
    // 点击搜索条件
    func sortButtonClick(){
        popView.show()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}





extension RFSearchViewController: UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, RFCollectionViewCellDelegate, UICollectionViewDelegateFlowLayout, RFSortTableViewDelegate{
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        // 设置collectionView
        setupCollectView()
        return true
    }
    
    // 点击搜索按钮
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "checkUserType_backward_9x15_"), style: .Plain, target: self, action: #selector(navigationBackClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_sort_21x21_"), style: .Plain, target: self, action: #selector(sortButtonClick))
        
        // 根据搜索条件搜索
        let keyword = searchBar.text
        RFNetworkTool.shareNetworkTool.loadSearchResult(keyword!, sort: "") { (results) in
            self.results = results
            self.collectionView!.reloadData()
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(searchCollectionCellID, forIndexPath: indexPath) as! RFCollectionViewCell
        cell.result = results[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    // 单独定义某个item的尺寸
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.mainScreen().bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSizeMake(width, height)
    }
    
    // 设定指定区域内边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // MARK - RFCollectionViewCellDelegate
    func collectionViewCellDidClickLikeButton(button: UIButton) {
        if !NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let loginVC = RFLoginViewController()
            loginVC.title = "登陆"
            let nav = RFNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        }
    }
    
    // MARK - RFSortTableViewDelegate
    func sortView(sortView: RFSortTableView, didSelectSortAtIndexPath sort: String) {
        let keyword = searchBar.text
        RFNetworkTool.shareNetworkTool.loadSearchResult(keyword!, sort: sort) { (results) in
            sortView.dismiss()
            self.results = results
            self.collectionView?.reloadData()
        }
    }
}











































