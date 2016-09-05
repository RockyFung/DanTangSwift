//
//  RFMeViewController.swift
//  DanTang-Swift
//
//  Created by rocky on 16/8/11.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFMeViewController: RFBaseViewController {

    var cellCount = 0
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 隐藏顶栏
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView(){
        let tableView = UITableView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = headerView
        tableView.tableFooterView = footerView
    }
    
    private lazy var headerView: RFMineHeaderView = {
        let headerView = RFMineHeaderView()
        headerView.frame = CGRectMake(0, 0, SCREENW, kYMMineHeaderImageHeight)
        headerView.iconButton.addTarget(self, action: #selector(iconButtonClick), forControlEvents: .TouchUpInside)
        headerView.messageButton.addTarget(self, action: #selector(messageButtonClick), forControlEvents: .TouchUpInside)
        headerView.settingButton.addTarget(self, action: #selector(settingButtonClick), forControlEvents: .TouchUpInside)
        return headerView
    }()
    
    private lazy var footerView: RFMeFooterView = {
        let footerView = RFMeFooterView()
        footerView.width = SCREENW
        footerView.height = 200
        return footerView
    }()
    
    // MARK: - 头部按钮点击
    func iconButtonClick() {
        // 判断是否登录
        if NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let actionSheet = UIAlertController(title: "", message: nil, preferredStyle: .ActionSheet)
            let cameraAction = UIAlertAction(title: "编辑资料", style: .Default, handler: { (_) in
                
            })
            let photoAction = UIAlertAction(title: "退出登录", style: .Destructive, handler: { (_) in
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: isLogin)
            })
            let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            actionSheet.addAction(cancelAction)
            actionSheet.addAction(cameraAction)
            actionSheet.addAction(photoAction)
            self.presentViewController(actionSheet, animated: true, completion: nil)
        } else {
            let loginVC = RFLoginViewController()
            loginVC.title = "登录"
            let nav = RFNavigationController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        }

    }
    
    // 消息
    func messageButtonClick() {
        let messageVC = RFMessageViewController()
        messageVC.title = "消息"
        navigationController?.pushViewController(messageVC, animated: true)
    }
    
    // 设置
    func settingButtonClick() {
        let settingVC = RFSettingViewController()
        settingVC.title = "设置"
        navigationController?.pushViewController(settingVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension RFMeViewController: UITableViewDelegate, UITableViewDataSource, RFMeChoiceViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let choiceView = RFMeChoiceView()
        choiceView.delegate = self
        return choiceView
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // 下拉的时候保持顶部没有间隙
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < 0 {
            var tempFrame = headerView.bgImageView.frame
            tempFrame.origin.y = offsetY
            tempFrame.size.height = kYMMineHeaderImageHeight - offsetY
            headerView.bgImageView.frame = tempFrame
        }
        
    }
    
    // RFMeChoiceViewDelegate
    func clickChoiceViewButton(button: UIButton) {
        if  button.tag == 1000 {
            print("点击了喜欢的商品")
        }else if button.tag == 1001 {
            print("点击了喜欢的专题")
        }
    }
    
}




















