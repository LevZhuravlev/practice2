//
//  TableViewCellType1.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit

class TableViewCellFirstType: UITableViewCell, DogeCellProtocol {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UITextView!
    @IBOutlet weak var imageForDog: UIImageView! {
        didSet {
            if oldValue == nil {
                activityIndicator.stopAnimating()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        imageForDog.layer.cornerRadius = 8
        imageForDog.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
