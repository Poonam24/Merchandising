//
//  ProductListInteractorTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 28/11/21.
//

import XCTest
@testable import Merchandising

class ProductListInteractorTests: XCTestCase {
    
    var interactor : ProductListInteractor?
    var mockPresenter = MockProductListPresenter()

    override func setUpWithError() throws {
        super.setUp();
        interactor = ProductListInteractor()
        interactor?.presenter = mockPresenter;
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testFetchProductList() {
        let response = MockResponse().testFetchProductList()
        let fetchSuccessful = true
        XCTAssertTrue(fetchSuccessful, "Successful")
        mockPresenter.productListFetchedSuccess(list: response)
    }
}


class MockProductListPresenter: ProductListPresenterInterface {
    func startFetchingProductList() {
        
    }
    
    func productListFetchedSuccess(list: [ProductModel]) {
        let fetchSuccessful = true
        XCTAssertTrue(fetchSuccessful, "Successful")

    }
    
    func productListFetchFailed(error: Error) {
        
    }
    
    func navigateToDetailScreen(details: ProductModel) {
        
    }
    
    
}
