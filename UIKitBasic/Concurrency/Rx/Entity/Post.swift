//
//  Post.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var userId: Int = 0
    @objc dynamic var title: String = ""

    override static func primaryKey() -> String? { "id" }
}

extension Post {
    func toModel() -> PostModel {
        PostModel(id: id, userId: userId, title: title)
    }
}
