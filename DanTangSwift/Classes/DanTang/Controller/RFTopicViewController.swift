//
//  RFTopicViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/15.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit
let homeCellId = "homeCellId"

class RFTopicViewController: UITableViewController, RFHomeCellDelegate {

    var type = Int()
    var items = [RFHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RFGlobalColor()
        setupTableVew()
        
        // 添加刷新控件
        refreshControl = RFRefreshControl()
        refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(loadHomeData), forControlEvents: .ValueChanged)
        
        // 获取首页数据
        loadHomeData()
        
    }
    
    func loadHomeData(){
        // 获取首页数据
        RFNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            self.items = homeItems
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    
    func setupTableVew(){
        tableView.rowHeight = 160
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(RFHomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeCellId)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count ?? 0 // items.count != nil items.count : 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeCellId) as! RFHomeCell
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = RFDetailViewController()
        detailVC.title = "攻略详细"
        detailVC.homeItem = items[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    

    // MARK: - YMHomeCellDelegate
    func homeCellDidClickFavoriteButton(button: UIButton) {
        
    }
}

























