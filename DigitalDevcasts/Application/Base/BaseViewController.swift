//
//  BaseViewController.swift
//  DigitalDevcasts
//
//  Created by Innovecto iOS on 4/19/16.
//  Copyright © 2016 Digital Devcasts. All rights reserved.
//

import UIKit

public enum Navigation {
    case Home
}

class BaseViewController: UIViewController {
    
    let navigationBar = DDNavigation()
    let menuButton    = DDButton()
    let cartButton    = DDButton()
    let searchButton  = DDButton()
    let closeButton   = DDButton()
    let backButton    = DDButton()
    let searchBar     = DDTextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView(Global.Color.WHITE)
        
    }
    
    func prepareView(color: UIColor) {
        view.backgroundColor = color
    }
    
    func setupNavigation(navigation: Navigation, title: String) {
        
        navigationBar.frame   = CGRectMake(0, 0, Global.WIDTH, 70)
        
        let navigationItem    = UINavigationItem()
        
        menuButton.frame      = CGRectMake(0, 0, 30, 30)
        menuButton.addImage("Menu")
        let menuItem          = UIBarButtonItem()
        menuItem.customView   = menuButton
        
        closeButton.frame      = CGRectMake(0, 0, 30, 30)
        closeButton.addImage("Dismiss Icon")
        let closeItem          = UIBarButtonItem()
        closeItem.customView   = closeButton
        
        switch navigation {
        case .Home:
            navigationBar.MenuNavigation()
            navigationItem.title = title
            navigationItem.leftBarButtonItems = [menuItem]
            navigationItem.rightBarButtonItems = [closeItem]
        }
        
        navigationBar.items = [navigationItem]
    }

}
