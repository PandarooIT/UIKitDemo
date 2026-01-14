//
//  ClassViewController.swift
//  UIKitBasic
//
//  Created by Macbook on 14/1/26.
//  Copyright © 2026 Pan Nguyen. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {
    

    @IBOutlet weak var speedLabelA: UILabel!
    
    @IBOutlet weak var speedLabelB: UILabel!
    
    var vehicleA: Vehicle!
   var vehicleB: Vehicle!

   override func viewDidLoad() {
       super.viewDidLoad()

       let car = Car(speed: 60)
       vehicleA = car
       vehicleB = car
       updateUI()
   }

   func updateUI() {
       speedLabelA.text = "A: " + vehicleA.description()
       speedLabelB.text = "B: " + vehicleB.description()
       print("A: \(vehicleA.description())")
       print("B: \(vehicleB.description())")
   }
  
    @IBAction func inscreaseButtonTapped(_ sender: Any) {
                vehicleA.speed += 20
        updateUI()
    }
 

    class Vehicle {
        var speed: Int

        init(speed: Int) {
            self.speed = speed
        }

        func description() -> String {
            return "Speed: \(speed) km/h"
        }
    }

    class Car: Vehicle {
        override func description() -> String {
            return "Car running at \(speed) km/h"
        }
    }
    
    class Motorbike: Vehicle {
        override func description() -> String {
            return "Motorbike running at \(speed) km/h"
        }
    }
}
