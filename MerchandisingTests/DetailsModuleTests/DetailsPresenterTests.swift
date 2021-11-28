//
//  DetailsPresenterTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising

class DetailsPresenterTests: XCTestCase {

    var presenter : ProductDetailsPresenter?
    
    override func setUpWithError() throws {
        super.setUp()
        presenter = ProductDetailsPresenter();
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testSetUpPresenter() {
        presenter?.setUpView();
        let setupSuccesful = true
        XCTAssertTrue(setupSuccesful)
        let setupFailed = false;
        XCTAssertFalse(setupFailed)


    }

    
}
