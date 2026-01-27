//
//  BaseViewModel.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

struct BaseModel: Codable {
    var title: String
    var description: String
    
    static let exampleDummyModels = [
        BaseModel(title: "Dummy1", description: "Dummy1"),
        BaseModel(title: "Dummy2", description: "Dummy1"),
        BaseModel(title: "Dummy3", description: "Dummy1"),
        BaseModel(title: "Dummy4", description: "Dummy1")
    ]
}
