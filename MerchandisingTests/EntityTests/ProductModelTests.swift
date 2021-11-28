//
//  ProductModelTests.swift
//  MerchandisingTests
//
//  Created by Poonam on 27/11/21.
//

import XCTest
@testable import Merchandising

class ProductModelTests: XCTestCase {
    
    

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testCreation() -> ProductModel {
        let modal = ProductModel(name: "iPhone", price: "$ 1000000", image: "Spinner.jpg")
        return modal
    }


}
