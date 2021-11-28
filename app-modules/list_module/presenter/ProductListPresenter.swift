//
//  Presenter.swift
//  ProductListing
//
//  Created by Poonam on 24/11/21.
//

import Foundation

class ProductListPresenter : ProductListPresenterInterface {
    
     var interactor: ProductListInteractorInterface?
     weak var view : ProductListViewInterface?
     var router : ProductListRouterInterface?
    
    func navigateToDetailScreen(details : ProductModel) {
        guard let view = view else { return }
        router?.presentDetailScreen(fromView: view, details : details)
    }
    
    func startFetchingProductList() {
        interactor?.fetchProductList();
    }
    
    func productListFetchedSuccess(list: [ProductModel]) {
        view?.updateView(list)
    }
    
    func productListFetchFailed(error: Error) {
        view?.showAlert(title: "Alert", msg: error.localizedDescription);
    }
    
}
