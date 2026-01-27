//
//  RxInteractor.swift
//  UIKitBasic
//
//  Created by Macbook on 27/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

final class RxInteractor: RxInteractorProtocol {

    init() {
        seedMockDataIfNeeded()
    }

    private func seedMockDataIfNeeded() {
        do {
            let realm = try Realm()

            if realm.objects(User.self).isEmpty {
                try realm.write {

                    let users = [
                        User(value: ["id": 1, "name": "Alice"]),
                        User(value: ["id": 2, "name": "Bob"]),
                        User(value: ["id": 3, "name": "Charlie"])
                    ]
                    let posts = [
                        Post(value: ["id": 1, "userId": 1, "title": "Post A"]),
                        Post(value: ["id": 2, "userId": 1, "title": "Post B"]),
                        Post(value: ["id": 3, "userId": 2, "title": "Post C"])
                    ]

                    realm.add(users, update: .modified)
                    realm.add(posts, update: .modified)
                }
            }
        } catch {
            print("Mock data error:", error)
        }
    }
    
    func fetchUsers() -> Observable<[UserModel]> {
        Observable.create { observer in
            do {
                let realm = try Realm()
                let models = realm.objects(User.self)
                                   .map { $0.toModel() }
                observer.onNext(Array(models))
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func fetchPosts() -> Observable<[PostModel]> {
        Observable.create { observer in
            do {
                let realm = try Realm()
                let models = realm.objects(Post.self)
                                   .map { $0.toModel() }
                observer.onNext(Array(models))
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
