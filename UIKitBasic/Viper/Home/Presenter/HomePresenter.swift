//
//  HomePresenter.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

final class HomePresenter {
    
    private weak var view: HomeViewProtocol?
    private var router: HomeRouterProtocol?
    private var interactor: HomeInteractorProtocol?
    private var datas: [BaseModel]?
    
    init(view: HomeViewProtocol?, router: HomeRouterProtocol?, interactor: HomeInteractorProtocol?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

// MARK: - Interface Setup
extension HomePresenter: HomePresenterProtocol {
    
    func notifyViewDidLoad() {
        view?.setupView()
        view?.setTitle(with: "Home")
        fetchDatas()
    }
    
    func getDataByIndex(_ index: Int) -> BaseModel? {
        datas?[index]
    }
    
    func fetchDatas() {
        datas = interactor?.datas
    }
    
    var getItemCount: Int {
        datas?.count ?? 0
    }
    
    var getSectionCount: Int {
        1
    }
}
