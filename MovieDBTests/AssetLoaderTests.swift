//
//  AssetLoaderTests.swift
//  MovieDBTests
//
//  Created by Chris Pflepsen on 10/30/23.
//

import XCTest
@testable import MovieDB

struct AssetObject: Codable {
    let name: String
}

final class AssetLoaderTests: XCTestCase {

    func testLoadingAsset() throws {
        let apiKey = try AssetLoader.loadJSONAsset(name: "API", type: APIConfig.self)
        XCTAssertNotNil(apiKey)
    }

    func testMissingKey() {
        XCTAssertThrowsError(try AssetLoader.loadJSONAsset(name: "not here", type: APIConfig.self))
    }

    func testInvalidJSONFormat() {
        XCTAssertThrowsError(try AssetLoader.loadJSONAsset(name: "API", type: AssetObject.self))
    }

    func testLoadPreviewJSON() throws {
        let result = try AssetLoader.loadPreviewContent(name: "PopularMovies", type: MovieResult.self)
        XCTAssertNotNil(result)

        let credits = try AssetLoader.loadPreviewContent(name: "Credits", type: CreditsResponse.self)
        XCTAssertNotNil(credits)
    }

}
