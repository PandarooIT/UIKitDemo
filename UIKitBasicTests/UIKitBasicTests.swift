//
//  UIKitBasicTests.swift
//  UIKitBasicTests
//
//  Created by Macbook on 22/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import Testing
import XCTest
@testable import UIKitBasic

class Viper_ExampleTests: XCTestCase {
    private var homeInteractor: MockHomeInteractor!
    private var homeRouter: MockHomeRouter!
    private var homeView: MockHomeView!
    private var homePresenter: HomePresenterProtocol!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        homeInteractor = MockHomeInteractor()
        homeRouter = MockHomeRouter()
        homeView = MockHomeView()
        homePresenter = HomePresenter(view: homeView, router: homeRouter, interactor: homeInteractor)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        homePresenter = nil
        homeInteractor = nil
        homeRouter = nil
        homeView = nil
    }
    
    func testNotifyViewDidLoad() {
        homePresenter.notifyViewDidLoad()
        XCTAssertTrue(homeView.invokedSetupView)
        XCTAssertTrue(homeView.invokedSetTitle)
    }
    
    func testGetDataByIndex() {
        XCTAssertNil(homePresenter.getDataByIndex(0))
        homeInteractor.stubbedDatas = BaseModel.exampleDummyModels
        homePresenter.fetchDatas()
        XCTAssertNotNil(homePresenter.getDataByIndex(0))
    }
    
    func testFetchDatas() {
        homePresenter.fetchDatas()
        XCTAssertTrue(homeInteractor.invokedDatasGetter)
    }
    
    func testGetItemCount() {
        XCTAssertEqual(homePresenter.getItemCount, 0)
        homeInteractor.stubbedDatas = BaseModel.exampleDummyModels
        homePresenter.fetchDatas()
        XCTAssertEqual(homePresenter.getItemCount, 4)
    }
    
    func testGetSectionCount() {
        XCTAssertEqual(homePresenter.getSectionCount, 1)
    }
}
