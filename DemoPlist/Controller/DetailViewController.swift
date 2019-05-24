//
//  DetailViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/27/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var deletes: UIButton!
    @IBOutlet weak var cities: UILabel!
    @IBOutlet weak var districts: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var yearOld: UILabel!
    @IBOutlet weak var dev: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        data!.alpha = 0
        guard let cities    = userDefault.object(forKey: "cities")    as? String else {return}
        self.cities.text    = cities
        guard let districts = userDefault.object(forKey: "districts") as? String else {return}
        self.districts.text = districts
        guard let name      = userDefault.object(forKey: "name")      as? String else {return}
        self.name.text      = name
        guard let yearOld   = userDefault.object(forKey: "YearOld")   as? String else {return}
        self.yearOld.text   = yearOld
        guard let dev       = userDefault.object(forKey: "Developer") as? String else {return}
        self.dev.text       = dev
        guard let sex       = userDefault.object(forKey: "sex")       as? String else {return}
        self.sex.text       = sex
        
    }
    @IBAction func deletes(_sender: Any) {
        userDefault.removeObject(forKey: "cities")
        cities.text    = ""
        userDefault.removeObject(forKey: "districts")
        districts.text = ""
        userDefault.removeObject(forKey: "name")
        name.text      = ""
        userDefault.removeObject(forKey: "YearOld")
        yearOld.text   = ""
        userDefault.removeObject(forKey: "Developer")
        dev.text       = ""
        userDefault.removeObject(forKey: "sex")
        sex.text       = ""
        deletes!.alpha = 0
        data!.alpha    = 1
        
        
        
    }
    
    
}
