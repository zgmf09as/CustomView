//
//  SecondViewController.swift
//  CustomView
//
//  Created by monk773 on 2017. 10. 19..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        stepper.maxValue = 10
        stepper.minValue = 0
        stepper.leftTitle = "Down"
        stepper.rightTitle = "UP"
        
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        view.addSubview(stepper)
    }
    
    @objc func logging(_ sender: CSStepper) {
        NSLog("현재 스테퍼의 값은 \(sender.value) 입니다")
    }
}
