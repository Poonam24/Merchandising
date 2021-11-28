//
//  ProductDetailRouter.swift
//  Merchandising
//
//  Created by Poonam on 25/11/21.
//

import Foundation
import UIKit

class ProductDetailsRouter {

    //static var detailModel : ProductDetailModel?

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

//    static func updateModelData(_ detail : ProductModel) {
//         detailModel = ProductDetailModel(from: JSONDecoder() as! Decoder)
//
//        detailModel.image_ids = detail.image_ids;
//        detailModel.price = detail.price;
//        detailModel.name = detail.name;
//        detailModel.image_urls = detail.image_urls;
//        detailModel.image_urls_thumbnails = detail.image_urls_thumbnails;
//    }
    
    static func createProductDetailModule(withDetails : ProductModel) -> UIViewController {
        
        guard let productDetailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? ProductDetailsViewController else {
            fatalError("Invalid view controller type")
        }

        let presenter = ProductDetailsPresenter()
        let interactor = ProductDetailsInteractor(model : withDetails)
        productDetailVC.presenter = presenter;
        presenter.view = productDetailVC
        presenter.interactor = interactor
        interactor.presenter = presenter
        return productDetailVC
    }
    
}
