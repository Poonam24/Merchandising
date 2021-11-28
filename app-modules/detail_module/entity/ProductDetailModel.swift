//
//  ProductDetailModel.swift
//  Merchandising
//
//  Created by Poonam on 27/11/21.
//

import Foundation


public class ProductDetailModel : Codable {
    
    var price : String?
    var name : String?
    var image_ids : [String?]
    var image_urls : [String?]
    var image_urls_thumbnails : [String?]

    enum ProductDetailKeys: String, CodingKey
    {
        case  name, price, image_urls, image_urls_thumbnails
    }
}
