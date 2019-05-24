//
//  ExperienceViewController.swift
//  DemoPlist
//
//  Created by Anh vũ on 4/27/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class ExperienceViewController: UITableViewController {
    var Developer = ["Fresher", "Junior", "Team Leader" , "Project Manager", "Senior Developer", "Technical Lead", "Software Architect", "Manager"]
    
    @IBOutlet weak var titleString: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        
    }
    @objc func run (){
            titleString.shake()
    }
    @IBAction func save(_ sender: Any) {
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Developer.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Developer[indexPath.row]
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         _ = segue.destination as? DetailViewController
        if let indexPath = tableView.indexPathForSelectedRow{
           userDefault.set(Developer[indexPath.row], forKey: "Developer")
        }
    }
    
}
