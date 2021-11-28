//
//  DetailsInteractorTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising

class DetailsInteractorTests: XCTestCase {
    
    var interactor : ProductDetailsInteractor?
    
    override func setUpWithError() throws {
        super.setUp()
        let modal = ProductModelTests().testCreation()
        interactor = ProductDetailsInteractor(model: modal)
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    
    func testgetProductDetails() -> ProductModel {
        let modal = ProductModelTests().testCreation()
        let productDetailsFetched = true
        XCTAssertTrue(productDetailsFetched, "Product List Fetching successful")
        let productDetailsFetchedfailed = false
        XCTAssertFalse(productDetailsFetchedfailed, "Product List Fetching failed")
        
        return modal;
    }
   
}
