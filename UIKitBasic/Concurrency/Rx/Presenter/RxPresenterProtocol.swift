//
//  RxPresenterProtocol.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

protocol RxPresenterProtocol {
    func viewDidLoad()
    func numberOfRows() -> Int
    func item(at index: Int) -> RxCellViewModel
}


