//
//  TableViewCellSecondType.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit

class TableViewCellSecondType: UITableViewCell {
    
    var imageViewLabel: UIImageView = UIImageView()
    var label: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setView()
        selectionStyle = .none

    }
    
    func setView() {
        
        // Image equal to half of screen width
        addSubview(imageViewLabel)
        addSubview(label)

        imageViewLabel.backgroundColor = .red
        imageViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageViewLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        imageViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        imageViewLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: UIScreen.main.bounds.width/2).isActive = true
        imageViewLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true
//        imageViewLabel.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -8).isActive = true

        // label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageViewLabel.bottomAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        label.text = "Label"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
