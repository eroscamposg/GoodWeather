//
//  WebServices.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/20/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation

//A Resource is something you are requesting
struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class WebService {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        URLSession.shared.dataTask(with: resource.url, completionHandler: { data, response, error in
                        
            if let data = data {
                //Send to the main thread
                DispatchQueue.main.async {
                    //Converts the data
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
            
        }).resume()
    }
}
