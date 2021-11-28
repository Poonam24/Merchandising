//
//  ImageLoader.swift
//  Merchandising
//
//  Created by Poonam on 26/11/21.
//

import Foundation
import UIKit

/*
//MARK: SOLID Principle applied, open for extension, closed for modification
class ImageCache : NSCache<NSString, UIImage> {
    
    static let shared = ImageCache()
    // making it singleto to be accessible across app
    override private init() {}
    
     func imageExistInCache(for imageID: String) -> Bool {
        var isExist : Bool = false
        if ImageCache.shared.object(forKey: imageID as NSString) != nil {
            isExist = true;
        }
        return isExist;
    }
    
     func getImage(for url: String, completion: @escaping ((UIImage?,  Error?)->(Void))) {
            if let cachedImage = ImageCache.shared.object(forKey: url as NSString) {
                completion(cachedImage, nil)
            }
    }
    
     func setImage(for imageID: String, image : UIImage) {
        ImageCache.shared.setObject(image, forKey: imageID as NSString)
    }
}
*/
