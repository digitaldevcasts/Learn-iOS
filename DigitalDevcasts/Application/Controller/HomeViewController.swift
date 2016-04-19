//
//  HomeViewController.swift
//  DigitalDevcasts
//
//  Created by Innovecto iOS on 4/19/16.
//  Copyright © 2016 Digital Devcasts. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var ArrayOfString : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let URL = "http://localhost:8000/api/v1/Book"
        Alamofire.request(.GET, URL).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json["Book"])")
                }
            case .Failure(let error):
                print(error)
            }
        }
        
        prepareTable()
        prepareView(Color.BLUE_LIGHT)

    }
    
    func prepareTable() {
        tableView.frame = CGRectMake(0, 20, Global.WIDTH, Global.HEIGHT)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
            cell.backgroundColor = Color.ORANGE
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

}