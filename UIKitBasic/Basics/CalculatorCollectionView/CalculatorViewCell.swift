//
//  CalculatorViewCell.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class CalculatorViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        containerView.backgroundColor = .clear
    }
    
    func configure(with button: CalculatorButton) {
        titleLabel.text = button.title
        containerView.backgroundColor = button.backgroundColor
        layoutIfNeeded()
        // Rounded Button
        containerView.layer.cornerRadius = containerView.bounds.height / 2
        containerView.clipsToBounds = true
    }
}
