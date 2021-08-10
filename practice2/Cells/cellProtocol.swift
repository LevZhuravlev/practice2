//
//  cellProtocol.swift
//  practice2
//
//  Created by Lev Zhuravlev on 29.07.2021.
//

import UIKit

protocol DogeCellProtocol: AnyObject {
    var titleLabel: UILabel! {get set}
    var imageForDog: UIImageView! {get set}
    var activityIndicator: UIActivityIndicatorView! {get set}
}
