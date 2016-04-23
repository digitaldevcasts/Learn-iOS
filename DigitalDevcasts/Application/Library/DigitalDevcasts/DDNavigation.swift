//
//  WatsonsNavigationBar.swift
//  Watsons
//
//  Created by Innovecto iOS on 4/13/16.
//  Copyright © 2016 Watsons. All rights reserved.
//

import Foundation
import UIKit

class DDNavigation: UINavigationBar, UINavigationBarDelegate {
    
    func GeneralNavigation() {
        let titleAtributes = [
            NSForegroundColorAttributeName : Global.Color.WHITE,
            NSFontAttributeName : UIFont(name: Global.F_Style.G_BOLD, size: Global.F_Size.FONT_16)!
        ]
        self.backgroundColor     = Global.Color.BLUE_LIGHT
        self.titleTextAttributes = titleAtributes
        self.translucent         = false
        self.barTintColor        = Global.Color.BLUE_LIGHT
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    }
    
    func MenuNavigation() {
        let titleAtributes = [
            NSForegroundColorAttributeName : Global.Color.WHITE,
            NSFontAttributeName : UIFont(name: Global.F_Style.G_BOLD, size: Global.F_Size.FONT_16)!
        ]
        self.delegate            = self
        self.backgroundColor     = Global.Color.BLUE_LIGHT
        self.titleTextAttributes = titleAtributes
        self.translucent         = false
        self.barTintColor        = Global.Color.BLUE_LIGHT
        self.shadowImage         = UIImage()
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    }
}
