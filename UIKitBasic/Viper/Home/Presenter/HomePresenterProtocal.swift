//
//  HomePresenterProtocal.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol: AnyObject {
    func notifyViewDidLoad() -> Void
    func getDataByIndex(_ index: Int) -> BaseModel?
    func fetchDatas() -> Void
    var getItemCount: Int { get }
    var getSectionCount: Int { get }
}
