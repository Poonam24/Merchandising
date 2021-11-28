//
//  productCell.swift
//  Merchandising
//
//  Created by Poonam on 24/11/21.
//

import Foundation
import UIKit
import ImageCache

/*
 This is custom table view cell holding image, name and price of product
 This can be re-used independetly for same kind of data
 */

class CustomCell : UITableViewCell {
    
    var imageCache = ImageCache.Cache.shared
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    func configureCell(_ data : ProductModel) {
        
        // styling for imageView of cell
        productImageView.layer.borderWidth = 1.0
        productImageView.layer.masksToBounds = false
        productImageView.layer.borderColor = UIColor.white.cgColor
        productImageView.clipsToBounds = true
        
        // Styling for shadow around the cell
        shadowView.backgroundColor = .white // very important
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOpacity = 0.50
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowView.layer.shadowColor = UIColor.gray.cgColor
        shadowView.layer.cornerRadius = 10
        
        
        
        // populate product details in list row
        self.title.text = data.name?.uppercased()
        self.price.text = data.price
        
        // load image thumbnail
        guard let imageURL = data.image_urls_thumbnails[0], let imageID =  data.image_ids[0] else {
            return
        }
        loadImage(imageURL: imageURL, imageID : imageID)
    }
    
    func loadImage(imageURL : String, imageID : String) {
        let url : URL = URL.init(string: imageURL)!;
        
        // retrieves image if already available in cache
        if(imageCache.imageExistInCache(for: imageID)) {
            imageCache.getImage(for: imageID) { (imageFromCache, error) -> (Void) in
                DispatchQueue.main.async {
                    self.productImageView.image = imageFromCache
                }
            }
        } else {
            // image does not available in cache.. so retrieving it from url
            Utils.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                let image = UIImage.init(data: data) ?? UIImage(named: "Spinner")
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.productImageView.image = image
                    self.imageCache.setImage(for: imageID, image: image!)
                    
                }
            }
        }
    }
}
