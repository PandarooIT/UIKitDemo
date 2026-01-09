//
//  ImageViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 9/1/26.
//

import UIKit
import SwiftUI

class ImageViewController: UIViewController {
    
    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "ic_vis_sell")
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

struct ImageViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
        ImageViewController()
    }
  }
}

