//
//  TableViewCellType1.swift
//  practice2
//
//  Created by Lev Zhuravlev on 15.07.2021.
//

import UIKit

class TableViewCellFirstType: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
