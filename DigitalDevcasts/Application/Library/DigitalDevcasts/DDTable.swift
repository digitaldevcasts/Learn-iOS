//
//  WatsonsNavigationBar.swift
//  Watsons
//
//  Created by Innovecto iOS on 4/13/16.
//  Copyright © 2016 Watsons. All rights reserved.
//

import Foundation
import UIKit

class DDTable: UITableView  {
    func General(separatorColor: UIColor, separatorWidth: CGFloat){
        self.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.layoutMargins  = UIEdgeInsetsZero
        self.separatorInset = UIEdgeInsets(top: 0, left: separatorWidth, bottom: 0, right: 0)
        self.separatorColor = separatorColor
    }
}
