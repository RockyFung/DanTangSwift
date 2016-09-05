//
//  RFCategoryHeaderViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/25.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

let categoryCollectionCellID = "YMCategoryCollectionViewCell"

class RFCategoryHeaderViewController: RFBaseViewController {

    var collections = [RFCollection]()
    var collectionView : UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        
        setupUI()
        
        // 分类界面 顶部 专题合集
        RFNetworkTool.shareNetworkTool.loadCategoryCollection(6) { (collections) in
            self.collections = collections
            self.collectionView!.reloadData()
        }
        
    }

    private func setupUI(){
        let headerView = NSBundle.mainBundle().loadNibNamed(String(RFTopHeaderView), owner: nil, options: nil).last as! RFTopHeaderView
        headerView.frame = CGRectMake(0, 0, SCREENW, 40)
        headerView.delegate = self
        view.addSubview(headerView)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: CGRectMake(0, 40, SCREENW, 95), collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        let cellNib = UINib(nibName: String(RFCategoryCollectionViewCell), bundle: nil)
        collectionView.registerNib(cellNib, forCellWithReuseIdentifier: categoryCollectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension RFCategoryHeaderViewController: RFTopHeaderViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // 点击查看全部按钮
    func topViewDidClickMoreButton(button: UIButton) {
        let seeAllVC = RFSeeAllController()
        seeAllVC.title = "查看全部";
        navigationController?.pushViewController(seeAllVC, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(categoryCollectionCellID, forIndexPath: indexPath) as! RFCategoryCollectionViewCell
        cell.collection = collections[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let collectionDetailVC = RFCollectionDetailController()
        let collection = collections[indexPath.row]
        collectionDetailVC.title = collection.title
        collectionDetailVC.id = collection.id
        collectionDetailVC.type = "专题合集"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(kitemW, kitemH)
    }
}





















