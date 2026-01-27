//
//  LocalService.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation

final class LocalService {
    
    // MARK: - Properties
    static let shared: LocalService = LocalService()
    
    // MARK: - Methods
    func saveDummyData() {
        let dataKey = "dummyDatas"
        var dummyDatas: [BaseModel] = []
        for number in 0...10 {
            dummyDatas.append(BaseModel(title: "DummyTitle\(number)", description: "DummyDescription\(number)"))
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(dataKey)
            
            do {
                if let encoded = try? JSONEncoder().encode(dummyDatas) { try encoded.write(to: fileURL) }
            } catch {
                fatalError("An error was taken on save progress")
            }
        }
    }
    
    func readData() -> [BaseModel]? {
        let dataKey = "dummyDatas"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(dataKey)
            do{
                let stringContent = try String(contentsOf: fileURL, encoding: .utf8)
                if let decoded = try? JSONDecoder().decode([BaseModel].self, from: stringContent.data(using: .utf8) ?? Data()) {
                    return decoded
                }
            } catch{
                fatalError("An error was taken on read progress")
                
            }
        }
        return []
    }
}
