//
//  RFLoginViewController.swift
//  DanTangSwift
//
//  Created by rocky on 16/8/19.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

import UIKit

class RFLoginViewController: RFBaseViewController {

    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgetPwdBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBarButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 设置导航栏按钮
    private func setupBarButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(cancelButtonClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(regiisterButtonClick))
    }
    /// 取消按钮点击
    func cancelButtonClick() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    /// 注册按钮点击
    func regiisterButtonClick() {
        let registerVC = RFRegisterViewController()
        registerVC.title = "注册"
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    // 其他方式登录
    @IBAction func otherLoginType(sender: UIButton) {
        if let buttonType = RFOtherLoginButtonType(rawValue: sender.tag){
            switch buttonType {
            case .weiboLogin:
                break
            case .weChatLogin:
                break
            case .QQLogin:
                break
            }
        }
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
