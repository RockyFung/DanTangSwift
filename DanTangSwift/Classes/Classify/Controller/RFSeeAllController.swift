//
//  RFSeeAllController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/26.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

let seeAllcellID = "YMSeeAllTopicCell"


class RFSeeAllController: RFBaseViewController {

    var collections = [RFCollection]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: String(RFSeeAllTopicCell),bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: seeAllcellID)
        tableView.separatorStyle = .None
        tableView.rowHeight = 160
        tableView.delegate = self
        tableView.dataSource = self
        // 分类界面、顶部专辑合集
        RFNetworkTool.shareNetworkTool.loadCategoryCollection(20) { (collections) in
            self.collections = collections
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RFSeeAllController: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(seeAllcellID) as! RFSeeAllTopicCell
        cell.collection = collections[indexPath.row]
        cell.selectionStyle = .None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let collectionDetailVC = RFCollectionDetailController()
        let collection = collections[indexPath.row]
        collectionDetailVC.title = collection.title
        collectionDetailVC.id = collection.id
        collectionDetailVC.type = "专题合集"
        navigationController?.pushViewController(collectionDetailVC, animated: true)
    }
}












































