//
//  ViewController.swift
//  ArcGenerator
//
//  Created by Jack Wu on 2014-12-09.
//  Copyright (c) 2014 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let params = ArcParams(radius: 100,
            lineWidth: 10,
            padding: 0,
            startAngle: 3.0*M_PI/2.0,
            clockwise: true,
            color:  UIColor.whiteColor(),
            name: "arc",
            frameCount: 360)
        let generator = ArcGenerator()
        generator.generateArcs(params)
    }


}

