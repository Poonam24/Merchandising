//
//  DetailScreenPresenter.swift
//  Merchandising
//
//  Created by Poonam on 26/11/21.
//

import Foundation

class ProductDetailsInteractor : ProductDetailsInteractorInterface {
    var productDetails : ProductModel;
    weak var presenter : ProductDetailsPresenterInterface?
    
    init(model : ProductModel) {
        productDetails = model;
    }
    
    func getProductDetails() -> ProductModel{
        return productDetails;
    }
    
}
