//
//  LabelViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 08/01/2026.
//

import UIKit
import SwiftUI
class LabelViewController: UIViewController {
    
    private var textLabel = UILabel()
    
    private var subtitleLabel : UILabel = {
        var label = UILabel()
        label.text = "The best subtitle of the year"
        label.textColor = .gray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        view.backgroundColor = .white
        
        textLabel.text = "Hello World!"
        textLabel.font = UIFont.systemFont(ofSize: 20)
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

struct LabelViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
      LabelViewController()
    }
  }
}

