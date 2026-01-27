//
//  RxPresenter.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import RxSwift

final class RxPresenter: RxPresenterProtocol {

    weak var view: RxViewProtocol?
    private let interactor: RxInteractorProtocol
    private let disposeBag = DisposeBag()

    private var items: [RxCellViewModel] = []

    init(view: RxViewProtocol,
         interactor: RxInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }

    func viewDidLoad() {
        Observable
            .combineLatest(
                interactor.fetchUsers(),
                interactor.fetchPosts()
            )
            .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background))
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] users, posts in
                    self?.items = users.map { user in
                        let count = posts.filter { $0.userId == user.id }.count
                        return RxCellViewModel(
                            title: user.name,
                            subtitle: "\(count) posts"
                        )
                    }
                    self?.view?.reload()
                },
                onError: { [weak self] error in
                    self?.view?.showError(error.localizedDescription)
                }
            )
            .disposed(by: disposeBag)
    }

    func numberOfRows() -> Int {
        items.count
    }

    func item(at index: Int) -> RxCellViewModel {
        items[index]
    }
}
