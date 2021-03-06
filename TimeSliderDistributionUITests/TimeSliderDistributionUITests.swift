//
//  TimeSliderDistributionUITests.swift
//  TimeSliderDistributionUITests
//
//  Created by Charles Hart on 1/25/16.
//  Copyright © 2016 lernu. All rights reserved.
//

import XCTest

class TimeSliderDistributionUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let app = XCUIApplication()
        app.tables["Empty list"].childrenMatchingType(.Button).element.tap()
        
        let tablesQuery = app.tables
        let button = tablesQuery.childrenMatchingType(.Button).element
        button.tap()
        button.tap()
        
        let cell = tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(0)
        cell.tap()
        cell.sliders["0%"].tap()
        
    }
    
}
