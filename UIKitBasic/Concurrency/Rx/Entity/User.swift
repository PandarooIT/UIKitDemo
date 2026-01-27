//
//  Model.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""

    override static func primaryKey() -> String? { "id" }
}

extension User {
    func toModel() -> UserModel {
        UserModel(id: id, name: name)
    }
}
