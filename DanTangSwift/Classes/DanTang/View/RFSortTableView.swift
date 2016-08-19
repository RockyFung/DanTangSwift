//
//  RFSortTableView.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/19.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
import SnapKit

let sortTableViewCellID = "sortTableViewCellID"

protocol RFSortTableViewDelegate: NSObjectProtocol {
    func sortView(sortView: RFSortTableView, didSelectSortAtIndexPath sort :String)
}

class RFSortTableView: UIView {
    let cells = ["默认排序", "按热度排序", "价格从低到高", "价格从高到低"]
    // 排序方式
    let sorts = ["", "hot", "price%3Aasc", "price%3Adesc"]
    
    weak var delegate :RFSortTableViewDelegate?
    
    func show(){
        let window = UIApplication.sharedApplication().keyWindow
        self.frame = UIScreen.mainScreen().bounds
        self.backgroundColor = UIColor.clearColor()
        window?.addSubview(self)
        
    }

    override func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
        self.removeFromSuperview()
    }
    
    func dismiss(){
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgView)
        bgView.addSubview(tableView)
        bgView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(60)
            make.right.equalTo(self)
            make.size.equalTo(CGSizeMake(140, 150))
        }
        tableView.snp_makeConstraints { (make) in
            make.edges.equalTo(bgView).offset(UIEdgeInsetsMake(kMargin, kMargin, -kMargin, 0))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 懒加载
    private lazy var bgView: UIImageView = {
       let bgView = UIImageView()
        bgView.userInteractionEnabled = true
        bgView.image = UIImage(named: "bg_menu_sort_140x46_")
        return bgView
    }()
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        tableView.rowHeight = 35
        tableView.scrollEnabled = false
        tableView.separatorColor = .None
        let nib = UINib(nibName: String(RFSortCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: sortTableViewCellID)
        return tableView
    }()
    
}





extension RFSortTableView: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(sortTableViewCellID) as! RFSortCell
        cell.titleLabel.text = cells[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let sort = sorts[indexPath.row]
        delegate?.sortView(self, didSelectSortAtIndexPath: sort)
    }
}




























