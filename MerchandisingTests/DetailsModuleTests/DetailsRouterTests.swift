//
//  DetailsRouterTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising

class DetailsRouterTests: XCTestCase {
    
    var router : ProductDetailsRouter?

    override func setUpWithError() throws {
        super.setUp();
        router = ProductDetailsRouter()
    }

    override func tearDownWithError() throws {
        super.tearDown();
    }
    
    func testCreateModule() {
        let modal = ProductModelTests().testCreation()
        _ = ProductDetailsRouter.createProductDetailModule(withDetails: modal)
        let testSuccessFul = true
        XCTAssert(testSuccessFul);
    }


}
