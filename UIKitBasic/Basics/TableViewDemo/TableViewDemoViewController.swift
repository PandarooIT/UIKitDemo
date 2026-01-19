//
//  TableViewDemoViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 15/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class TableViewDemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    struct AppRender {
        var name: String
        var imageName: String
    }
    
    var appList: [AppRender] = [
        AppRender(name: "Facebook", imageName: "ic_facebook"),
        AppRender(name: "Google", imageName: "ic_facebook"),
        AppRender(name: "Motorist1", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist2", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist3", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist4", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist5", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist6", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist7", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist8", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist9", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist10", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist11", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist12", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist13", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist14", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist15", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist1", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist2", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist3", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist4", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist5", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist6", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist7", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist8", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist9", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist10", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist11", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist12", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist13", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist14", imageName: "ic_vis_sell"),
        AppRender(name: "Motorist15", imageName: "ic_vis_sell"),

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "DemoTableViewCell", bundle: nil), forCellReuseIdentifier: "democell")
        
    }
    
}


extension TableViewDemoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell", for: indexPath) as! DemoTableViewCell
        
        cell.labelCell.text = appList[indexPath.row].name
        cell.imageViewCell.image = UIImage(named: appList[indexPath.row].imageName)
        cell.tag = indexPath.row
        return cell
        
//        let cell = Bundle.main.loadNibNamed("DemoTableViewCell", owner: self, options: nil)?.first as! DemoTableViewCell
//
//        cell.labelCell.text = appList[indexPath.row].name
//        cell.imageViewCell.image = UIImage(named: appList[indexPath.row].imageName)
//
//        return cell
//        
    }
}

extension TableViewDemoViewController: UITableViewDelegate {
    
}


