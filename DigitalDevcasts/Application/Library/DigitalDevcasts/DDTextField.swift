//
//  WatsonsNavigationBar.swift
//  Watsons
//
//  Created by Innovecto iOS on 4/13/16.
//  Copyright © 2016 Watsons. All rights reserved.
//

import UIKit

public enum UITextFieldBorderSide {
    case Top, Bottom, Left, Right, All
}

public enum Alignment {
    case Left, Right, Center
}

public enum Padding {
    case Left, Right, Top, Bottom
}

public enum Position {
    case Left, Right
}

class DDTextField: UITextField, UITextFieldDelegate {
    
//    let inset: CGFloat = 10
//    
//    // placeholder position
//    override func textRectForBounds(bounds: CGRect) -> CGRect {
//        return CGRectInset(bounds , inset , inset)
//    }
//    
//    // text position
//    override func editingRectForBounds(bounds: CGRect) -> CGRect {
//        return CGRectInset(bounds , inset , inset)
//    }
//    
//    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
//        return CGRectInset(bounds, inset, inset)
//    }
    
    func addGeneral(
        align               : Alignment,
        placeholder         : String,
        placeholderColor    : UIColor,
        textColor           : UIColor,
        tintColor           : UIColor,
        bgColor             : UIColor,
        fontStyle           : String,
        fontSize            : CGFloat,
        corner              : CGFloat
    ) {
        switch align {
        case .Left:
            self.textAlignment = .Left
        case .Right:
            self.textAlignment = .Right
        case .Center:
            self.textAlignment = .Center
        }
        
        self.clearsOnBeginEditing = true
        self.clearButtonMode      = .Always
        self.delegate             = self
        self.textColor            = textColor
        self.placeholder          = placeholder
        self.backgroundColor      = bgColor
        self.tintColor            = tintColor
        self.font                 = UIFont(name: fontStyle, size: fontSize)
        self.layer.cornerRadius   = corner
        self.setValue(placeholderColor, forKeyPath: "_placeholderLabel.textColor")
    }
    
    func addBorder(
        side    : UITextFieldBorderSide,
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
    
    func addPadding(width: CGFloat, padding: Padding) {
        let paddingWidth   = UIView()
        paddingWidth.frame = CGRectMake(0, 0, width, self.frame.height)
        
        switch padding {
        case .Left:
            self.leftView   = paddingWidth
            self.leftViewMode  = .Always
        case .Right:
            self.rightView     = paddingWidth
            self.rightViewMode = .Always
        default: ()
        }
        
    }
    
    func addImage(imageName: String, width: CGFloat, padding: Padding) {
        let image = UIImageView()
        image.image = UIImage(named: imageName)
        image.frame = CGRectMake(0, 0, width, self.frame.height)
        image.contentMode = .Center
        
        switch padding {
        case .Left:
            self.leftView      = image
            self.leftViewMode  = .Always
        case .Right:
            self.rightView     = image
            self.rightViewMode = .Always
        default: ()
        }
        
    }
    
    func addButton(imageName: String, position: Position) {
        let button = DDButton()
        button.addImage(imageName)
        button.frame = CGRectMake(0, 0, 30, self.frame.height)
        button.action(barcodeAction)
        
        switch position {
        case .Left:
            self.leftView      = button
            self.leftViewMode  = .Always
        case .Right:
            self.rightView     = button
            self.rightViewMode = .Always
        }
    }
    
    func barcodeAction() {
        print("Barcode")
    }
    
}

