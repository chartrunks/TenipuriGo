//
//  TenidexViewController.swift
//  TenipuriGo
//
//  Created by Mac on 5/31/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class TenidexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var caughtTennisBoys : [TennisBoy] = []
    var uncaughtTennisBoys : [TennisBoy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        caughtTennisBoys = getAllCaughtTennisBoys()
        uncaughtTennisBoys = getAllUncaughtTennisBoys()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "CAUGHT"
        } else {
            return "UNCAUGHT"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return caughtTennisBoys.count
        } else {
            return uncaughtTennisBoys.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tennisBoy : TennisBoy
        if indexPath.section == 0 {
            tennisBoy = caughtTennisBoys[indexPath.row]
        } else {
            tennisBoy = uncaughtTennisBoys[indexPath.row]
        }
        
        let cell = UITableViewCell()
        cell.textLabel?.text = tennisBoy.name
        cell.imageView?.image = UIImage(named: tennisBoy.imageName!)
        return cell
    }

    
    @IBAction func mapTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
