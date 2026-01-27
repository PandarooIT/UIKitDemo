//
//  HomeViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 21/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var collectionView: UICollectionView!
    
    private var listConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
    var presenter: HomePresenterProtocol = HomePresenter(view: nil, router: nil, interactor: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.notifyViewDidLoad()
    }
}

// MARK: - Protocol Setup
extension HomeViewController: HomeViewProtocol, UICollectionViewDelegate {
    
    func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "baseCell")
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
    func setTitle(with title: String) {
        self.title = title
    }
}

// MARK: - Layout Configure
extension HomeViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { index, environment in
            var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            configuration.backgroundColor = .secondarySystemBackground
            configuration.headerMode = .none
            return .list(using: configuration, layoutEnvironment: environment)
        }
        return layout
    }
}

// MARK: - CollectionView DataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getItemCount
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.getSectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "baseCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureLabels(with: presenter.getDataByIndex(indexPath.row))
        return cell
    }
}
