//
//  netWorking.swift
//  practice2
//
//  Created by Lev Zhuravlev on 26.07.2021.
//

import UIKit

class NetWorkService {
    
    var errorClientHandler: ((Error) -> Void)?
    var errorServerHandler: ((URLResponse) -> Void)?

    func getDoges(completionHandler: @escaping ([DogType]?)->()) {
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
            let dogStruct = try? decoder.decode(NetWorkData.self, from: data!)
            completionHandler(dogStruct?.generateDogTypes())
        }
        
        task.resume()
    }
    
    static func getImageURLFor(dogClass: DogType, completionHandler: @escaping (URL) -> ()) {
        
        guard let url = URL(string: "https://dog.ceo/api/breed/\(dogClass.name)/images/random") else {
            return
        }
                    
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            let dogImageStruct = try? decoder.decode(ImageData.self, from: data)
            
            guard let imageUrl = URL(string: dogImageStruct?.message ?? "") else {return}
            completionHandler(imageUrl)
        }.resume()
    }
    
    static func getImageByURL(url: URL, completionHandler: @escaping (UIImage) -> ()) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                completionHandler(image)
            }
        }.resume()
    }
    
    static var lock = NSLock()
    
    static func getImage(for dog: DogType, completionHandler: @escaping (UIImage)->()) {
        lock.lock()
        NetWorkService.getImageURLFor(dogClass: dog) { url in
            NetWorkService.getImageByURL(url: url) { image in
                self.lock.unlock()
                completionHandler(image)
            }
        }
    }
}
