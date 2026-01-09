//
//  StackViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 9/1/26.
//

import UIKit
import SwiftUI

class StackViewController: UIViewController {

    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...3 {
            stackView.addArrangedSubview(createRectangle())
        }
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func createRectangle() -> UIView {
        let rect = UIView()
        rect.backgroundColor = .systemRed
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rect.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        return rect
    }

}

struct StackViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
        StackViewController()
    }
  }
}
