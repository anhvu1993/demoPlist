//
//  YearoldViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/26/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class YearoldViewController: UIViewController {
   
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        customDatePicker()
    }
    func customDatePicker (){
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(action(datePicker:)), for: .valueChanged)
        let tapGesture      = UITapGestureRecognizer(target: self, action: #selector(viewTap(gesture:)))
        view.addGestureRecognizer(tapGesture)
        textField.inputView = datePicker
    }
    @objc func viewTap(gesture: UITapGestureRecognizer){
        view.endEditing(true)
    }

    @objc func action(datePicker: UIDatePicker){
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/YYYY"
        textField.text   = dateFormatter.string(from: datePicker.date)
        let data         = textField.text
        userDefault.set(data, forKey: "YearOld")
        view.endEditing(true)
        
        
    }
    
}
