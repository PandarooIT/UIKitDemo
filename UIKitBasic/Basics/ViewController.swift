//
//  ViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 08/01/2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var primaryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hel2lo")
        view.backgroundColor = .systemBlue
        
        greetingLabel.text = "Hello Panda!"
    }

    func greetUser(_ name: String) {
        greetingLabel.text = name
    }
    
    @IBAction func primaryButtonTapped(_ sender: Any) {
        greetUser("Pan")
        view.backgroundColor = .white
    }
}

