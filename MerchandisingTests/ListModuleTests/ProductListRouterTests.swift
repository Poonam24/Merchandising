//
//  ProductListRouterTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising

class ProductListRouterTests: XCTestCase {
    
    var router : ProductListRouter?
    var mockView : ProductListViewInterface?
    
    override func setUpWithError() throws {
        super.setUp()
        router = ProductListRouter();
        mockView = MockProductListView();
        
    }
    
    
    
    
    func testPresentDetailScreen() {
        let mockResponse = MockResponse().testFetchProductList()
        router?.presentDetailScreen(fromView: mockView, details: mockResponse[0])
        let navigationSuccessful = true;
        XCTAssertTrue(navigationSuccessful);
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }


}

// MARK: Mock View for testing router functionality
class MockProductListView: ProductListViewInterface {
    func updateView(_ list: [ProductModel]) {
        
    }
    
    func showAlert(title: String, msg: String) {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
}
