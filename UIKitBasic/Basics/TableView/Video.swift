//
//  Video.swift
//  UIKitBasic
//
//  Created by Macbook on 13/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation

class Video {
    var title: String
    var image: String
    
    init (title: String, image: String) {
        self.title = title
        self.image = image
    }
    
    static func listMockData() -> [Video] {
        return [
            Video(title: "Swift cơ bản cho người mới", image: "swift"),
            Video(title: "Làm chủ Auto Layout", image: "rectangle.3.offgrid"),
            Video(title: "TableView từ A đến Z", image: "list.bullet"),
            Video(title: "CollectionView nâng cao", image: "square.grid.2x2"),
            Video(title: "Hiểu về Delegate Pattern", image: "person.2.wave.2"),
            Video(title: "MVVM Architecture", image: "arrow.triangle.branch"),
            Video(title: "Xử lý Networking API", image: "network"),
            Video(title: "Core Data & Local Storage", image: "externaldrive"),
            Video(title: "Animation trong UIKit", image: "film"),
            Video(title: "Deploy App lên Store", image: "paperplane.fill")
        ]
    }
}
