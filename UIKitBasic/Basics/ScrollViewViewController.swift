//
//  ScrollViewViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 12/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class ScrollViewViewController: UIViewController {

    private var scrollView = UIScrollView()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private let rectHeight: CGFloat = 200
    private let numberOfRects = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1 ..< numberOfRects {
            stackView.addArrangedSubview(createRectangle())
        }
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = (rectHeight * CGFloat(numberOfRects))
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
    
    func createRectangle() -> UIView {
        let rect = UIView()
        rect.backgroundColor = .systemGray
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.widthAnchor.constraint(equalToConstant: rectHeight).isActive = true
        rect.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        rect.layer.cornerRadius = 16
        return rect
    }

}

//#Preview {
//    ScrollViewViewController()
//}
