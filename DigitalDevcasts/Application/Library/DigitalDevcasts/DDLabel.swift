//
//  WatsonsNavigationBar.swift
//  Watsons
//
//  Created by Innovecto iOS on 4/13/16.
//  Copyright © 2016 Watsons. All rights reserved.
//

import UIKit

public enum LabelBorder {
    case Top, Bottom, Left, Right, All
}

public enum LabelAlign {
    case Left, Right, Center
}

public enum LabelPadding {
    case Left, Right, Top, Bottom
}

class DDLabel: UILabel {
    
    /* SET TITLE */
    func addText(
        text        : String,
        color       : UIColor,
        style       : String,
        size        : CGFloat,
        align       : LabelAlign
    ) {
        switch align {
        case .Left:
            self.textAlignment = .Left
        case .Right:
            self.textAlignment = .Right
        case .Center:
            self.textAlignment = .Center
        }
            
        self.text                      = text
        self.textColor                 = color
        self.font                      = UIFont(name: style, size: size)
    }
    
    func addAutoHieght() {
        self.numberOfLines             = 0
        self.lineBreakMode             = NSLineBreakMode.ByWordWrapping
        self.adjustsFontSizeToFitWidth = true
        self.sizeToFit()
    }
    
    /* SET BORDER */
    func addBorder(
        side    : LabelBorder,
        color   : UIColor,
        width   : CGFloat
    ) {
        let border         = CALayer()
        border.borderWidth = width
        border.borderColor = color.CGColor
            
        switch side {
        case .All:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
    
}
