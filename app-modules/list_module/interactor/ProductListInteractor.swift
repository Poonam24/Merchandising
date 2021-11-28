//
//  ProductListInteractor.swift
//  Merchandising
//
//  Created by Poonam on 24/11/21.
//

import Foundation

class ProductListInteractor : ProductListInteractorInterface {
    
     weak var presenter : ProductListPresenterInterface?
    
    func fetchProductList() {
        if(Utils.isInternetConnectionAvailable()) {
            let url = URL.init(string: MERCHANDISE_LIST)!
            let session = URLSession.shared
            HttpClient(session: session).get(url: url) { (responseData, error) in
                if (error == nil) {
                    do {
                        let parsedResponse = try JSONDecoder().decode(ResultModel.self, from: responseData!)
                        self.presenter?.productListFetchedSuccess(list: parsedResponse.results)
                    } catch {
                        self.presenter?.productListFetchFailed(error: error)
                    }
                } else {
                    self.presenter?.productListFetchFailed(error: error!)
                }
            }
        } else {
            self.presenter?.productListFetchFailed(error:  CustomError.noInternetConnection)
            
        }
    }
}
    
    /*
     let fetchListTask = session.dataTask(with: request, completionHandler: {
     data, response, error in
     if (error == nil) {
     guard let httpResponse = response as? HTTPURLResponse else {
     return;
     }
     if (httpResponse.statusCode == 200) {
     do {
     let parsedResponse = try JSONDecoder().decode(ResultModel.self, from: data!)
     self.presenter?.productListFetchedSuccess(list: parsedResponse.results)
     } catch {
     self.presenter?.productListFetchFailed(error: error)
     }
     
     } else {
     self.presenter?.productListFetchFailed(error: error!)
     }
     } else {
     self.presenter?.productListFetchFailed(error: error!)
     }
     
     });
     fetchListTask.resume()
     } else {
     self.presenter?.productListFetchFailed(error:  CustomError.noInternetConnection)
     }
     }
    
}
     */
