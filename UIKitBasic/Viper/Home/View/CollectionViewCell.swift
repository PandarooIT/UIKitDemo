//
//  CollectionViewCell.swift
//  UIKitBasic
//
//  Created by Macbook on 22/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func configureLabels(with model: BaseModel?) {
        nameLabel.text = model?.title
        subTitleLabel.text = model?.description
    }

}
