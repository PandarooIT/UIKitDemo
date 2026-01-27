//
//  RxRouter.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

final class RxRouter: RxRouterProtocol {
    static func createModule() -> RxViewController {
        let view = RxViewController(
            nibName: "RxViewController",
            bundle: nil
        )
        let interactor = RxInteractor()
        let presenter = RxPresenter(
            view: view,
            interactor: interactor
        )
        view.presenter = presenter
        return view
    }
}
