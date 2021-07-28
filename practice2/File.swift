//
//  File.swift
//  practice2
//
//  Created by Lev Zhuravlev on 28.07.2021.
//

import Foundation


class DogType: Codable {
    var name: String
    var subclases: [String]
    var imageURL = "https://dog.ceo/api/breed/\(name)/images/random"
    
    init (name: String, subclases: [String]) {
        self.name = name
        self.subclases = subclases
    }
}
