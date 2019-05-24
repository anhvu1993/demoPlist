//
//  ViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/25/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    var dislayPlace: [Name] = []
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dislayPlace.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textString.text = dislayPlace[indexPath.row].name
        return cell
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
}

