//
//  RFProductViewController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/11.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

let collectionCellID = "YMCollectionViewCell"


class RFProductViewController: RFBaseViewController {

    var products = [RFProduct]()
    weak var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置collectionView
        setupCollectionView()
        
        RFNetworkTool.shareNetworkTool.loadProductData { (products) in
            self.products = products
            self.collectionView?.reloadData()
        }
    }

    // 设置collectionView
    private func setupCollectionView(){
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.backgroundColor = view.backgroundColor
        collectionView.dataSource = self
        let nib = UINib(nibName: String(RFCollectionViewCell), bundle: nil)
        collectionView.registerNib(nib, forCellWithReuseIdentifier: collectionCellID)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RFProductViewController:UICollectionViewDelegate, UICollectionViewDataSource, RFCollectionViewCellDelegate, UICollectionViewDelegateFlowLayout{
    // MARK: - UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellID, forIndexPath: indexPath) as! RFCollectionViewCell
        cell.product = products[indexPath.item]
        cell.delegate = self
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.mainScreen().bounds.width - 20) / 2
        let height: CGFloat = 245
        return CGSizeMake(width, height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    
    // MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let productDetailVC = RFProductDetailViewController()
        productDetailVC.product = products[indexPath.row]
        productDetailVC.title = "商品详情"
        navigationController?.pushViewController(productDetailVC, animated: true)
    }
    
    // MARK: - YMCollectionViewCellDelegate
    func collectionViewCellDidClickLikeButton(button: UIButton) {
        
    }
}






























