//
//  DemoTableViewCell.swift
//  UIKitBasic
//
//  Created by Macbook on 15/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var labelCell: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("\(tag)")
    }
}
