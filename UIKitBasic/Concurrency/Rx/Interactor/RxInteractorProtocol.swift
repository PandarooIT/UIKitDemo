//
//  RxInteractorProtocol.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation
import RxSwift
protocol RxInteractorProtocol {
    func fetchUsers() -> Observable<[UserModel]>
    func fetchPosts() -> Observable<[PostModel]>
}
