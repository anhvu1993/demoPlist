//
//  InformationViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/26/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    @IBOutlet weak var titleString: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var menu: UIStackView!
//    @IBOutlet weak var male: UIButton!
//    @IBOutlet weak var female: UIButton!
//    @IBOutlet weak var Other: UIButton!
    
    @IBOutlet var OutletButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        menu!.alpha = 0
    
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(runShake), userInfo: nil, repeats: true)
    }
    @objc func runShake(){
        titleString.shake()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let data = menu.center
        UIView.animate(withDuration: 5, animations:
            {self.menu!.alpha = 1})
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if name.text  == "" {
            let alert = UIAlertController(title: "Thông báo", message: "Vui lòng nhập Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    @IBAction func OnClick(_ sender: UIButton) {
//        enum Sex:String {
//            case male = "male"
//            case female = "Female"
//            case Other  = "other"
//        }
//        print(Sex.female.rawValue)
//        userDefault.set(name.text, forKey: "name")
//        userDefault.set(Sex.male.rawValue, forKey:   "sex")
//        userDefault.set(Sex.female.rawValue, forKey: "sex")
//        userDefault.set(Sex.Other.rawValue, forKey:  "sex")
        userDefault.set(sender.currentTitle, forKey: "sex")
                for item in OutletButton {
                    item.isSelected = false

                }
                sender.isSelected = true
    }
// cach 2
    
   /* @IBAction func male(_ sender: Any) {
        
        male.isSelected   = !male.isSelected
        userDefault.set("Male", forKey: "sex")
    }
    
    @IBAction func female(_ sender: Any) {
        female.isSelected = !female.isSelected
        userDefault.set("Female", forKey: "sex")
    }
    
    @IBAction func other(_ sender: Any) {
        Other.isSelected  = !Other.isSelected
        userDefault.set("Other", forKey: "sex")
    }
 */
    @IBAction func save(_ sender: Any) {
      userDefault.set(name.text, forKey: "name")
        
        
    }
}
