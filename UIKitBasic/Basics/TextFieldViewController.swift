//
//  TextFieldViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 9/1/26.
//

import UIKit
import SwiftUI

class TextFieldViewController: UIViewController {
    
    private var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search..."
        tf.font = UIFont.systemFont(ofSize: 14)
        
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
}

extension TextFieldViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("DEBUG: Search Pressed")
        textField.resignFirstResponder()
        return true
    }
}


struct TextFieldViewController_Previews: PreviewProvider {
  static var previews: some View {
    ViewControllerPreview {
        TextFieldViewController()
    }
  }
}
