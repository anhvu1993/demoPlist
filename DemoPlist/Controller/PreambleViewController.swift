//
//  PreambleViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/26/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class PreambleViewController: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var text: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        avatar!.alpha = 0
        text!.alpha   = 0
        _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(delayedAction), userInfo: nil, repeats: false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let centImage = avatar.center
        UIView.animate(withDuration: 3, animations:
            {self.avatar!.alpha = 1})
        {
            (finished) in UIView.animate(withDuration: 1, animations: {
                self.text!.center = CGPoint(x: self.view.frame.size.width / 2, y: 150)
                self.text!.alpha  = 1})
        }
    }
    @objc func delayedAction(){
        let storyboard        = UIStoryboard(name: "Main", bundle: nil)
        let nexViewController = storyboard.instantiateViewController(withIdentifier: "Home") as! CitiesViewController
        navigationController?.pushViewController(nexViewController, animated: true)
    }
    
}
