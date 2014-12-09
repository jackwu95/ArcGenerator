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
        let params = ArcParams(radius: 100)
        let generator = ArcGenerator()
        generator.generateArcs(params)
    }


}

