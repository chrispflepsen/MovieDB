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
        try app.performAccessibilityAudit(for: [.all]) { issue in
            guard issue.element != nil else { return true }
            return false
        }
    }

    func testDetailAccessibility() throws {
        let app = XCUIApplication()
        app.launch()
        let firstCell = app.collectionViews.cells.allElementsBoundByIndex.first
        firstCell!.tap()
        try app.performAccessibilityAudit()
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
