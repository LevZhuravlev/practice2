//
//  netWorking.swift
//  practice2
//
//  Created by Lev Zhuravlev on 26.07.2021.
//

import UIKit

class NetWorkService {
    
    var errorClientHandler: ((Error) -> ())?
    var errorServerHandler: ((URLResponse) -> ())?

    func getDoges() {
        let urlString = URL(string: "https://dog.ceo/api/breeds/list/all")
        guard let url = urlString else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {[unowned self] data, response, error in
            
            if let error = error {
                if let errorHandler = self.errorClientHandler {
                    errorHandler(error)
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                
                if let response = response, let errorServerHandler = self.errorServerHandler {
                    errorServerHandler(response)
                }
                return
            }
            
            let decoder = JSONDecoder()
            let DogStruct = try? decoder.decode(DogModel.self, from: data!)
            print(DogStruct?.generateDogTypes() ?? "")

        }
        
        
        task.resume()
    }
}

