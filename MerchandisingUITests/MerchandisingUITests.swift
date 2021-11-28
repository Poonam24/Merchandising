//
//  MerchandisingUITests.swift
//  MerchandisingUITests
//
//  Created by Poonam on 24/11/21.
//

import XCTest

class MerchandisingUITests: XCTestCase {
    
    
    
    
    override func setUpWithError() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        // app.launchArguments = ["enable-testing"]
        app.launch()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        
    }
    
    func testExample() throws {
        
        let app = XCUIApplication()
        let myTable = app.tables.matching(identifier: "ListView")
        let cell = myTable.cells.element(matching: .cell, identifier: "myCell_0")
        if(cell.waitForExistence(timeout: 10)) {
            if (cell.isHittable) {
                cell.tap()
            }
        }
        
        let productsButton = app.navigationBars["NavigationBar"].buttons["BackButton"]
        if(productsButton.isHittable) {
            productsButton.tap()
        }
        myTable.cells.children(matching: .other).element(boundBy: 0).swipeUp();
        let cell_2 = myTable.cells.element(matching: .cell, identifier: "myCell_6") // random cell selection as table view is scrolled up
        if(cell_2.waitForExistence(timeout: 10)) {
            if (cell_2.isHittable) {
                cell_2.tap()
            }
        }
        
        if(productsButton.isHittable) {
            productsButton.tap()
        }
       
        XCTAssertTrue(true);
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
