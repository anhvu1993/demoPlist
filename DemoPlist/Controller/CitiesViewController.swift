//
//  CitiesViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/26/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class CitiesViewController: BaseTableViewController {
    
    @IBOutlet weak var titleString: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let text = NSMutableAttributedString(string: "Where are you living?")
        text.addAttributes(attributed, range: NSRange(location: 0, length: text.length))
        titleLabel.attributedText = text
        tableView.tableHeaderView = titleLabel

        dislayPlace = DataSevice.shared.dataCities
        deleteBack()
      
    }
    
    

    func deleteBack(){
        var navigationArray = self.navigationController?.viewControllers
        navigationArray!.remove(at: (navigationArray?.count)! - 2)
        self.navigationController?.viewControllers = navigationArray!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as? DistrictsViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            DataSevice.shared.selecterCity = DataSevice.shared.dataCities[indexPath.row]
            userDefault.set(DataSevice.shared.dataCities[indexPath.row].name, forKey: "cities")
        }
        
    }
    
}
