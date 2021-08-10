//
//  TableViewCellSecondType.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit

class TableViewCellSecondType: UITableViewCell, DogeCellProtocol {

    var activityIndicator: UIActivityIndicatorView! = UIActivityIndicatorView()
    var titleLabel: UILabel! = UILabel()
    var imageForDog: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
        selectionStyle = .none
    }
    
    func setView() {
        
        imageForDog = UIImageView()
        
        // Image equal to half of screen width
        addSubview(imageForDog)
        addSubview(titleLabel)
        addSubview(activityIndicator)

        imageForDog.backgroundColor = .red
        imageForDog.translatesAutoresizingMaskIntoConstraints = false
        
        imageForDog.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        imageForDog.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        imageForDog.heightAnchor.constraint(greaterThanOrEqualToConstant: UIScreen.main.bounds.width/2).isActive = true
        imageForDog.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true

        imageForDog.layer.cornerRadius = 8
        imageForDog.clipsToBounds = true
        
        // label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageForDog.bottomAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        titleLabel.text = "Label"
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.topAnchor.constraint(equalTo: imageForDog.topAnchor).isActive = true
        activityIndicator.bottomAnchor.constraint(equalTo: imageForDog.bottomAnchor).isActive = true
        activityIndicator.leadingAnchor.constraint(equalTo: imageForDog.leadingAnchor).isActive = true
        activityIndicator.trailingAnchor.constraint(equalTo: imageForDog.trailingAnchor).isActive = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
