//
//  ProductModel.swift
//  TestApp
//
//  Created by Poonam on 07/07/21.
//

import Foundation

class ResultModel : Codable {
    var results : [ProductModel];
   
    
}

public class ProductModel : Codable {
    
    var price : String?
    var name : String?
    var image_ids : [String?] = []
    var image_urls : [String?] = []
    var image_urls_thumbnails : [String?] = []

    enum ProductKeys: String, CodingKey
    {
        case  name, price, image_urls, image_urls_thumbnails
    }
    
    init(name : String, price: String, image : String) {
        self.name = name;
        self.price = price
        self.image_urls.append(image)
    }
}
