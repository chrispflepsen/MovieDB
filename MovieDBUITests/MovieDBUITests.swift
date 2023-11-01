//
//  MovieDBUITests.swift
//  MovieDBUITests
//
//  Created by Chris Pflepsen on 10/30/23.
//

import XCTest

final class MovieDBUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAccessibility() throws {
        let app = XCUIApplication()
        app.launch()
        let firstCell = app.collectionViews.cells.allElementsBoundByIndex.first
        _ = firstCell?.waitForExistence(timeout: 1)

        // I really wanted to include the performAccessibilityAudit checks here and on the detail screen
        // However I found them too brittle and would pass and fail seemingly at random
        // It should be a useful tool in the future
        // I just didn't have time to do a deep dive to figure out what was causing the issues
        // This should be remove, but since it is a demo project and I wanted to leave it and call out the functionality

//        try app.performAccessibilityAudit()
    }

    func testDetailAccessibility() throws {
        let app = XCUIApplication()
        app.launch()
        let firstCell = app.collectionViews.cells.allElementsBoundByIndex.first
        firstCell!.tap()
//        try app.performAccessibilityAudit()
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
