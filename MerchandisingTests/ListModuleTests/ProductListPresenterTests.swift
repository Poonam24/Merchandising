//
//  ProductListPresenterTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising


class ProductListPresenterTests: XCTestCase {
    
    var presenter : ProductListPresenter?
    var mockInteractor = MockProductListInteractor()
    var mockView = MockViewController()
    

    override func setUpWithError() throws {
        super.setUp();
        presenter = ProductListPresenter()
        presenter?.interactor = mockInteractor
        presenter?.view = mockView
        mockInteractor.presenter = presenter;

    }

    
    func testStartFetchingProductList() {
        mockInteractor.fetchProductList1();
        XCTAssert(mockInteractor.fetchProductListSuccessful, "Product List Fetching successful")
    }
    
    func testProductListFetchedSuccess() {
        XCTAssertTrue(mockInteractor.fetchProductListSuccessful, "Product List Fetching successful")
        mockView.updateView(mockInteractor.fetchProductList1())
    }
    
    func testProductListFetchFailed() {
        XCTAssertFalse(mockInteractor.fetchProductListFailed, "Product List Fetching failed")
    }

   
    override class func tearDown() {
        super.tearDown();
    }
}



class MockProductListInteractor: ProductListInteractor {
    
    var fetchProductListSuccessful : Bool  = false;
    var fetchProductListFailed : Bool  = false;
    

     func fetchProductList1() -> [ProductModel] {
        var responseList : [ProductModel];
        let url = Bundle.main.url(forResource: "Response", withExtension: "json")!
        do {
            let data = (try? Data(contentsOf: url))!
            let parsedResponse = try? JSONDecoder().decode(ResultModel.self, from: data)
            responseList = parsedResponse!.results;
            fetchProductListSuccessful = true;
            XCTAssertTrue(fetchProductListSuccessful, "MockREsponse parsed succesful");
        }
        return responseList;
    }
    
}

class MockViewController: ProductListViewInterface {
    
    
    
    func updateView(_ list: [ProductModel]) {
        let updateViewCalled = true
        XCTAssertTrue(updateViewCalled, "update view called")
    }
    
    func showAlert(title: String, msg: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    
}
