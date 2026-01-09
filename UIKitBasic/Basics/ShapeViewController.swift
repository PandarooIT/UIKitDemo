//
//  ShapeViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 9/1/26.
//

import UIKit
import SwiftUI

class ShapeViewController: UIViewController {

    private var rectangle: UIView = {
        var rect = UIView()
        rect.layer.cornerRadius = 50
        return rect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rectangle.backgroundColor = .systemRed
        
        
        view.addSubview(rectangle)
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}

struct ShapeViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
        ShapeViewController()
    }
  }
}
