//
//  HomeRouter.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    static func createModule(using navigationController: UINavigationController) -> HomeViewController {
        let router = HomeRouter()
        let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        return view
    }
}
