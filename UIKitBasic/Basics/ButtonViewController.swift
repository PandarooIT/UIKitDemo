//
//  ButtonViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 08/01/2026.
//

import UIKit
import SwiftUI

class ButtonViewController: UIViewController {

    private var showNameButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Show Name", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var labelName: UILabel = {
        var label = UILabel()
        label.text = "Panda's here hehe hahhaha"
        label.textColor = .systemBlue
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showNameButton.addTarget(self, action: #selector(showNameButtonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
        
        view.addSubview(showNameButton)
        showNameButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        showNameButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        showNameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showNameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showNameButton.layer.cornerRadius = 10

        view.addSubview(labelName)
        labelName.topAnchor.constraint(equalTo: showNameButton.bottomAnchor, constant: 20).isActive = true
        labelName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func showNameButtonTapped() {
        labelName.isHidden.toggle()
    }
}


struct ButtonViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
      ButtonViewController()
    }
  }
}

