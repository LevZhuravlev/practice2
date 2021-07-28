//
//  ViewController.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var service = NetWorkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(UINib(nibName: "TableViewCellFirstType", bundle: nil), forCellReuseIdentifier: "TableViewCellFirstType")
        tableView.register(UINib(nibName: "TableViewCellSecondType", bundle: nil), forCellReuseIdentifier: "TableViewCellSecondType")
        tableView.register(UINib(nibName: "TableViewCellThirdType", bundle: nil), forCellReuseIdentifier: "TableViewCellThirdType")

        service.getDoges()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellSecondType", for: indexPath) as! TableViewCellSecondType
           
            return cell
        }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellThirdType", for: indexPath) as! TableViewCellThirdType
           
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellFirstType", for: indexPath) as! TableViewCellFirstType
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
    

}
