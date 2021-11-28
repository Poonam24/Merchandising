//
//  ProductPresenter.swift
//  Merchandising
//
//  Created by Poonam on 25/11/21.
//

import Foundation

class ProductDetailsPresenter : ProductDetailsPresenterInterface {
    weak var view: ProductDetailsViewInterface?
    
    var interactor: ProductDetailsInteractorInterface?
    
    func setUpView() {
        guard let productDetails = interactor?.getProductDetails() else {
            return
        }
        view?.updateView(productDetails)
    }
    
}
