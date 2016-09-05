//
//  RFCollectionDetailController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/29.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit


let collectionTableCellID = "YMCollectionTableViewCell"

class RFCollectionDetailController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var type = String()
    var posts = [RFCollectionPost]()
    var id: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let nib = UINib(nibName: String(RFCollectionTableViewCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: collectionTableCellID)
        tableView.rowHeight = 150
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        
        if type == "专题合集" {
            RFNetworkTool.shareNetworkTool.loadCollectionPosts(id!, finished: { (posts) in
                self.posts = posts
                self.tableView.reloadData()
            })
        }else if type == "风格品类" {
            RFNetworkTool.shareNetworkTool.loadStyleOrCategoryInfo(id!, finished: { (items) in
                self.posts = items
                self.tableView.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension RFCollectionDetailController: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(collectionTableCellID) as! RFCollectionTableViewCell
        cell.selectionStyle = .None
        cell.collectionPost = posts[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let postDetailVC = RFPostDetailViewController()
        postDetailVC.post = posts[indexPath.row]
        postDetailVC.title = "攻略详情"
        navigationController?.pushViewController(postDetailVC, animated: true)
    }
}






























