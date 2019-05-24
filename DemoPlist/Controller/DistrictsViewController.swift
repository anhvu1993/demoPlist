//
//  DistrictsViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/26/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DistrictsViewController: BaseTableViewController {
    var name:Int?
    var districtsData: [Districts] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        dislayPlace = DataSevice.shared.selecteDistricts
        
        self.tableView.rowHeight = 84
        tableView.separatorStyle = .none
//        tableView.backgroundColor = UIColorFromRGB(rgbValue: 0xFEEED4, alpha: 1.00)
        let heightForHeaderView : CGFloat = 200
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: heightForHeaderView))
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        let paragraphStype = NSMutableParagraphStyle()
        paragraphStype.paragraphSpacing = 10
        paragraphStype.alignment = NSTextAlignment.center
        let attributed = [NSAttributedString.Key.font: titleLabel.font, NSAttributedString.Key.paragraphStyle: paragraphStype] as [NSAttributedString.Key : Any]
        let text = NSMutableAttributedString(string: "What your gender?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.destination is InformationViewController else {return}
        if let indexPath = tableView.indexPathForSelectedRow {
            userDefault.set(dislayPlace[indexPath.row].name, forKey: "districts")
        }
    }
    
}
