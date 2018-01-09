//
//  ImageService.swift
//  ToolboxLGNT
//
//  Created by Émilie Legent on 05/01/2018.
//

import Foundation

public class ImageService {
    static public let shared = ImageService()
    private let caching = NSCache<NSString, UIImage>()
    
    public func getImage(at link: String, completion: @escaping (UIImage?) -> Void) {
        let qos = DispatchQoS.background.qosClass
        guard let url = URL(string: link) else {
            completion(nil)
            return
        }
        
        if let cachedImage = caching.object(forKey: NSString(string: link)) {
            completion(cachedImage)
            return
        }
        DispatchQueue.global(qos: qos).async {
            guard let data = try? Data(contentsOf: url) else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            let image = UIImage(data: data)!
            self.caching.setObject(image, forKey: NSString(string: link))
            DispatchQueue.main.async { completion(image) }
        }
    }
}
