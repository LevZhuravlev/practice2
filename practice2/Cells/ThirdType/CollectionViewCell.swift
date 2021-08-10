//
//  CollectionViewCell.swift
//  practice2
//
//  Created by Lev Zhuravlev on 19.07.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!    
    @IBOutlet weak var imageViewForDog: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = ""
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
     
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
