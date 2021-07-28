//
//  CollectionViewCell.swift
//  practice2
//
//  Created by Lev Zhuravlev on 19.07.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
     
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }

}
