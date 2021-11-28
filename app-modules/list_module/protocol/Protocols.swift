//
//  Protocols.swift
//  ProductListing
//
//  Created by Poonam on 24/11/21.
//

import Foundation
import UIKit

// Protocol from View to Presenter
protocol ProductListViewInterface  : class {
    func updateView(_ list : [ProductModel])
    func showAlert(title: String, msg : String)
    func showLoading()
    func hideLoading()
}

// Protocol from Presenter to Interactor
protocol ProductListInteractorInterface : class {
    func fetchProductList()
}

// Protocol for Presenter to Interactor and Presenter To View
protocol ProductListPresenterInterface : class {
    func startFetchingProductList();
    func productListFetchedSuccess(list : [ProductModel]);
    func productListFetchFailed(error : Error);
    func navigateToDetailScreen(details: ProductModel)

}
// Protocol for routing to next module i.e Detail of selected produc
protocol ProductListRouterInterface : class {
    func presentDetailScreen(fromView : ProductListViewInterface?, details: ProductModel);
}


