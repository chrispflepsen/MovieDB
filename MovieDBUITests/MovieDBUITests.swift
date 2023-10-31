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
        try app.performAccessibilityAudit()

    }

    func testDetailAccessibility() throws {
        let app = XCUIApplication()
        app.launch()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Five Nights at Freddy's"]/*[[".cells",".buttons[\"Five Nights at Freddy's, 2023\"].staticTexts[\"Five Nights at Freddy's\"]",".staticTexts[\"Five Nights at Freddy's\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
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
