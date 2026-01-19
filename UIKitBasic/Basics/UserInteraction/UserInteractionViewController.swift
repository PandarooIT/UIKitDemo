//
//  UserInteractionViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 19/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class UserInteractionViewController: UIViewController {

    @IBOutlet weak var viewLayout: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var doubleTapGesture: UITapGestureRecognizer!
    
    @IBOutlet var singleTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User interaction"
        singleTapGesture.require(toFail: doubleTapGesture)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("Touch up inside")
    }
    
    @IBAction func primaryActionTrigger(_ sender: UIButton) {
        print("primary Action tapped")
        let calculatorVC = CalculatorCollectionViewController(nibName: "CalculatorCollectionViewController", bundle: nil)

        navigationController?.pushViewController(calculatorVC, animated: true)
    }
    
    @IBAction func switchOnValueChanged(_ sender: UISwitch) {
        print("On value changed")
    }
    
    
    @IBAction func viewDoubleTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        print("This is double tap gesture")
        print("Tapped with 1 fingers")
    }
    
    @IBAction func viewSingleTapGestureRecognizer(_ sender: UITapGestureRecognizer) {
        print("This is single tap gesture")
        print("Tapped with 1 fingers")
        textField.resignFirstResponder()
    }
    
    @IBAction func threeFingersTapGesture(_ sender: UITapGestureRecognizer) {
        print("This is single tap gesture")
        print("Tapped with 3 fingers")
    }
    
    
    @IBAction func onEditingChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    @IBAction func onStartEditTextField(_ sender: UITextField) {
        print("Start editing")
    }
    
    @IBAction func onEndEditTextField(_ sender: UITextField) {
        print("End editing")
    }
    
    
    @IBAction func doneEnterText(_ sender: UITextField) {
        textField.resignFirstResponder()
    }
    
    
}
