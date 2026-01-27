//
//  HomeInteractor.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    var datas: [BaseModel]? {
        LocalService.shared.saveDummyData()
        return LocalService.shared.readData()
    }
}
