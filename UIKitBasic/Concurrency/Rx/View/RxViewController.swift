//
//  RxViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

final class RxViewController: UIViewController, RxViewProtocol {

    @IBOutlet weak var tableView: UITableView!
    var presenter: RxPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let nib = UINib(nibName: "RxCellTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RxCell")
        presenter.viewDidLoad()
    }

    func reload() {
        tableView.reloadData()
    }

    func showError(_ message: String) {
        print("Error", message)
    }
    
}

// MARK: - UITableViewDataSource
extension RxViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RxCell", for: indexPath) as? RxCellTableViewCell else {
            return RxCellTableViewCell()
        }
        
        let vm = presenter.item(at: indexPath.row)
        cell.textLabel?.text = vm.title
        cell.detailTextLabel?.text = vm.subtitle
        return cell
    }
}

