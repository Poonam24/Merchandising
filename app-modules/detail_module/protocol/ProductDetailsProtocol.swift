//
//  DetailScreenProtocol.swift
//  Merchandising
//
//  Created by Poonam on 26/11/21.
//

import Foundation
import UIKit


protocol ProductDetailsViewInterface : class {
    func updateView(_ withDetail : ProductModel)
}


protocol ProductDetailsInteractorInterface : class {
    func getProductDetails() -> ProductModel;
    
}

protocol ProductDetailsPresenterInterface : class {
    var view :ProductDetailsViewInterface? {get set}
    var interactor :ProductDetailsInteractorInterface? {get set}
    
   func setUpView();

}
