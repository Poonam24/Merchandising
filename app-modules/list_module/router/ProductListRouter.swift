//
//  Router.swift
//  ProductListing
//
//  Created by Poonam on 24/11/21.
//

import Foundation
import UIKit
    
class ProductListRouter : ProductListRouterInterface {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetailScreen(fromView: ProductListViewInterface?, details: ProductModel) {
        DispatchQueue.main.async {
            let productListVC = ProductDetailsRouter.createProductDetailModule(withDetails : details);
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            let topController = windowScene.windows.filter {$0.isKeyWindow}.first?.rootViewController as! UINavigationController
            topController.pushViewController(productListVC, animated: true)
           
        }
    }
}
