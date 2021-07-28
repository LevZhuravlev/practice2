//
//  DogModel.swift
//  practice2
//
//  Created by Lev Zhuravlev on 28.07.2021.
//

import Foundation

// MARK: - Welcome
class DogModel: Codable {
            
    var message: [String: [String]] = [:]
    var status: String = ""
    
    var allDogsList: [DogType] = []
    func generateDogTypes() {
        for (name, subclasses) in message {
            allDogsList.append(DogType(name: name, subclases: subclasses))
        }
    }
}
