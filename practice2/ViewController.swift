//
//  ViewController.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var service = NetWorkService()
    var dogList: [DogType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        service.getDoges { [unowned self] dogList in
            self.dogList = dogList ?? []
            
            DispatchQueue.main.async {
                activityIndicator.stopAnimating()
                self.setTableView(completionHandler: {
                    print("")
                })
            }
        }
    }
    
    func setTableView(completionHandler: @escaping ()->()?) {
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCellFirstType", bundle: nil), forCellReuseIdentifier: "TableViewCellFirstType")
        tableView.register(UINib(nibName: "TableViewCellSecondType", bundle: nil), forCellReuseIdentifier: "TableViewCellSecondType")
        tableView.register(UINib(nibName: "TableViewCellThirdType", bundle: nil), forCellReuseIdentifier: "TableViewCellThirdType")
        
        completionHandler()
    }
    
    let mySerialQueue = DispatchQueue(label: "LoadImage")
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if dogList[indexPath.row].subclases.count < 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellSecondType") as? TableViewCellSecondType else {
                return UITableViewCell()
            }
            
            let dog = dogList[indexPath.row]
            cell.titleLabel.text = dog.name.capitalized
            cell.imageForDog.backgroundColor = .gray
            cell.imageForDog?.image = nil

            mySerialQueue.async {
                if dog.images.count > 0 {
                    DispatchQueue.main.async {
                        cell.imageForDog?.image = dog.images[0]
                    }
                } else {
                    NetWorkService.getImage(for: dog) { image in
                        dog.images.append(image)
                        DispatchQueue.main.async {
                            cell.imageForDog?.image = dog.images[0]
                            cell.activityIndicator.stopAnimating()
                        }
                    }
                }
            }
            
            return cell
        } else if dogList[indexPath.row].subclases.count == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellThirdType") as? TableViewCellThirdType else {
                return UITableViewCell()
            }
            let dog = dogList[indexPath.row]
            cell.titleLabel.text = dogList[indexPath.row].name.capitalized + " third"
            mySerialQueue.async {
                if dog.images.count > 2 {
                    DispatchQueue.main.async {
                        for image in dog.images {
                            cell.imageForDog?.image = image
                        }
                    }
                } else {
                    
                    for index in 0...2 {
                        NetWorkService.getImage(for: dog) { image in
                            dog.images.append(image)
                            DispatchQueue.main.async {
                                cell.labels[index].text = dog.subclases[index]
                                cell.images[index].image = dog.images[index]
                                cell.activityIndicators[index].stopAnimating()
                                
                            }
                        }
                    }
                }
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellFirstType") as? TableViewCellFirstType else {
                return UITableViewCell()
            }
            
            let dog = dogList[indexPath.row]
            cell.titleLabel.text = dog.name.capitalized
            cell.detailLabel.text  = ""
            cell.imageForDog.backgroundColor = .gray
            cell.imageForDog?.image = nil

            dog.subclases.forEach {
                cell.detailLabel.text += $0 + "\n"}
            
            mySerialQueue.async {
                if dog.images.count > 0 {
                    DispatchQueue.main.async {
                        cell.imageForDog?.image = dog.images[0]
                    }
                } else {
                    NetWorkService.getImage(for: dog) { image in
                        dog.images.append(image)
                        DispatchQueue.main.async {
                            cell.imageForDog?.image = dog.images[0]
                            cell.activityIndicator.stopAnimating()
                        }
                    }
                }
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}
