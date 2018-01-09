//
//  DataService.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import Foundation

public class DataService {
    static public let shared = DataService()
    
    public func get<T: Decodable>(request: URLRequest, for type: T.Type, completion: @escaping (T?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            guard let data = data else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            guard let result = try? JSONDecoder().decode(T.self, from: data) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            DispatchQueue.main.async { completion(result) }
            }.resume()
    }
}
