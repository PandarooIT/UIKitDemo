//
//  CalculatorCollectionViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class CalculatorCollectionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var displayLabel: UITextField!
    
    // MARK: - Properties
    private let calculator = Calculator()
    private let buttons: [CalculatorButton] = [
        CalculatorButton(type: .function(.clear)),
        CalculatorButton(type: .function(.negate)),
        CalculatorButton(type: .function(.percent)),
        CalculatorButton(type: .operation(.divide)),

        CalculatorButton(type: .number(7)),
        CalculatorButton(type: .number(8)),
        CalculatorButton(type: .number(9)),
        CalculatorButton(type: .operation(.multiply)),

        CalculatorButton(type: .number(4)),
        CalculatorButton(type: .number(5)),
        CalculatorButton(type: .number(6)),
        CalculatorButton(type: .operation(.subtract)),

        CalculatorButton(type: .number(1)),
        CalculatorButton(type: .number(2)),
        CalculatorButton(type: .number(3)),
        CalculatorButton(type: .operation(.add)),

        CalculatorButton(type: .number(0)),
        CalculatorButton(type: .function(.decimal)),
        CalculatorButton(type: .operation(.equals))
    ]
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register XIB
        let nib = UINib(nibName: "CalculatorViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CalculatorViewCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 12
            layout.minimumLineSpacing = 12
            layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 12, right: 12)
        }
    }
    
    private func updateDisplay(_ value: String) {
        displayLabel.text = value
    }
    
    
    @IBAction func navigateTap(_ sender: UIButton) {
        let lifecycleVC = LifecycleViewController(nibName: "LifecycleViewController", bundle: nil)

        navigationController?.pushViewController(lifecycleVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension CalculatorCollectionViewController: UICollectionViewDataSource {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return buttons.count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalculatorViewCell", for: indexPath) as! CalculatorViewCell
       cell.configure(with: buttons[indexPath.item])
       return cell
   }
}

// MARK: - UICollectionViewDelegate
extension CalculatorCollectionViewController: UICollectionViewDelegate {
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let button = buttons[indexPath.item]
       let result = calculator.input(button)
       updateDisplay(result)
   }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CalculatorCollectionViewController: UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let spacing: CGFloat = 12
       // 4 gaps + 2 side margins
       let totalSpacing = spacing * 5
       let width = (collectionView.bounds.width - totalSpacing) / 4
       
       // Button "0"
       if indexPath.item == 16 {
           return CGSize(width: width * 2 + spacing, height: width)
       }
       
       return CGSize(width: width, height: width)
   }
}



