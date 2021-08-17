//
//  DogModel.swift
//  practice2
//
//  Created by Lev Zhuravlev on 28.07.2021.
//

import UIKit

class NetWorkData: Codable {
            
    var message: [String: [String]] = [:]
    var status: String = ""
    
    func generateDogTypes() -> [DogType] {
        var dogList: [DogType] = []
        for (name, subclasses) in message {
            dogList.append(DogType(name: name, subclases: subclasses))
        }
        return dogList
    }
}

struct ImageData: Codable {
    let message: String
    let status: String
}

class DogType {

    var name: String
    var subclases: [String]
    var imageLink: [URL] = []
    var images: [UIImage] = []
    
    internal init(name: String, subclases: [String]) {
        self.name = name
        self.subclases = subclases
    }
}
