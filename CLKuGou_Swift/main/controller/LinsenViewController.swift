//
//  LinsenViewController.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//

import UIKit

class LinsenViewController: BaseViewController {

    let titleArr = ["工具","游戏","推广"]
    lazy var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.setupLinsinTableView()
    }
    
    func setupLinsinTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRectMake(0, 0, APPW, APPH-TabBarHeight+2)
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false;
        tableView.backgroundView = UIImageView.init(image: UIImage(named: "bj"))
        tableView.tableHeaderView = self.headerView;
        tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        self.view.addSubview(tableView)
        
        let viewtab = UIView()
        viewtab.frame = CGRectMake(0, CGFloat(300+44*titleArr.count), APPW, 500)
        viewtab.backgroundColor = UIColor.whiteColor()
        tableView.addSubview(viewtab)
    }
    
    private lazy var headerView: LinsenHeadView = {
        let headerView = LinsenHeadView()
        headerView.frame = CGRectMake(0,0, APPW,300)
        return headerView
    }()
}

extension LinsenViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "linsencell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        cell!.textLabel?.text = titleArr[indexPath.row]
        return cell!
    }
}
