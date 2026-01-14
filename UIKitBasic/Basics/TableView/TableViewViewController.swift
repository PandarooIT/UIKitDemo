//
//  TableViewViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 13/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {
    private var tableView = UITableView()

    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 100
        tableView.register(TableViewCellController.self, forCellReuseIdentifier: Cells.videoCell)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension TableViewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell)
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
