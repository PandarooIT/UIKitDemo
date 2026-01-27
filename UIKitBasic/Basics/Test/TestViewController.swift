//
//  TestViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 22/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let queue = DispatchQueue(label: "com.fx.myqueue")

        queue.async {
            for i in 0..<10 {
                print("🔴", i)
            }
        }

        for i in 100..<110 {
            print("🔶", i)
        }
    }



}
