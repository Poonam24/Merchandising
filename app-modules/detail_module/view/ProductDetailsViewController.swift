//
//  ProductDetailViewController.swift
//  Merchandising
//
//  Created by Poonam on 26/11/21.
//

import Foundation
import UIKit
import ImageCache


class ProductDetailsViewController : UIViewController,  ProductDetailsViewInterface{
    
    var presenter : ProductDetailsPresenterInterface?
    
    var imageCache = ImageCache.Cache.shared

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    
    override func viewDidLoad() {
        
        presenter?.setUpView();
        self.view.bringSubviewToFront(image);
        containerView.backgroundColor = .white // very important
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOpacity = 0.50
        containerView.layer.shadowRadius = 10
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.cornerRadius = 10
        

        image.layer.cornerRadius = image.frame.height/2
        image.layer.masksToBounds = true
        image.clipsToBounds = true

        view.backgroundColor = .white
    }
    
    func updateView(_ withDetail: ProductModel) {
        productName.text = withDetail.name?.uppercased()
        productPrice.text = withDetail.price
        guard let imageURL = withDetail.image_urls[0] else {
            return
        }
        self.updateImageView(imageURL);
        
    }

    func updateImageView(_ imageURL : String){
        let url : URL = URL.init(string: imageURL)!;
        
        
        if(imageCache.imageExistInCache(for: imageURL)) {
            imageCache.getImage(for: imageURL) { (imageFromCache, error) -> (Void) in
                DispatchQueue.main.async {
                    self.image.image = imageFromCache
                }
            }
        } else {
            // image does not available in cache.. so retrieving it from url
            Utils.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                let image = UIImage.init(data: data) ?? UIImage(named: "Spinner")
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.image.image = image
                    self.imageCache.setImage(for: imageURL, image: image!)
                    
                }
            }
        }
    }
}
