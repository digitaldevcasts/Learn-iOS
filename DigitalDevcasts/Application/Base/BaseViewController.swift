//
//  BaseViewController.swift
//  DigitalDevcasts
//
//  Created by Innovecto iOS on 4/19/16.
//  Copyright © 2016 Digital Devcasts. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView(Color.WHITE)
        
    }
    
    func prepareView(color: UIColor) {
        view.backgroundColor = color
    }

}
