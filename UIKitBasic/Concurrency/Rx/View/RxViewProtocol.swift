//
//  RxViewProtocol.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation
protocol RxViewProtocol: AnyObject {
    func reload()
    func showError(_ message: String)
}
