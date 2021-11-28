//
//  LoginModuleBuilder.swift
//  TestApp
//
//  Created by Poonam on 07/07/21.
//

import Foundation
import UIKit

class ModuleBuilder {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func buildDefaultModule() -> UIViewController {
            
        guard let view = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            fatalError("Invalid view controller type")
        }
            let router = ProductListRouter()
            let presenter = ProductListPresenter()
            let interactor = ProductListInteractor()
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            presenter.view = view
            interactor.presenter = presenter
            return view
        }
    
}
