//
//  LoginViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 13/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var stackView = UIStackView()
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var titleTV: UILabel = {
        let title = UILabel()
        title.text = NSLocalizedString("title_login", comment: "")
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 35)
        title.numberOfLines = 0
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var descriptionTV: UILabel = {
        let description = UILabel()
        description.text = NSLocalizedString("description_login", comment: "")
        description.textColor = .black
        description.font = UIFont.systemFont(ofSize: 15)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private var emailTF: UITextField = {
        let email = UITextField()
        email.font = UIFont.systemFont(ofSize: 14)
        email.borderStyle = .roundedRect
        email.layer.borderWidth = 1.0
        email.layer.borderColor = UIColor.systemGray4.cgColor
        email.layer.cornerRadius = 10.0
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(titleTV)
        view.addSubview(descriptionTV)
        view.addSubview(emailTF)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            descriptionTV.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            descriptionTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            titleTV.topAnchor.constraint(equalTo: descriptionTV.bottomAnchor, constant: 35),
            titleTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTF.topAnchor.constraint(equalTo: titleTV.bottomAnchor, constant: 35),
            emailTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
   

}
//
//#Preview {
//    LoginViewController()
//}
