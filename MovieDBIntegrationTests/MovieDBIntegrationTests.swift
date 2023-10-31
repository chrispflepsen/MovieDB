//
//  MovieDBIntegrationTests.swift
//  MovieDBIntegrationTests
//
//  Created by Chris Pflepsen on 10/30/23.
//

import XCTest
@testable import MovieDB

final class MovieDBIntegrationTests: XCTestCase {

    let api = MovieAPI()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPopular() async throws {
        let result = try await api.perform(request: PopularMoviesRequest())
        XCTAssertNotNil(result)
    }

    func testCredits() async throws {
        let movie = (MovieResult.popular?.results.first)!
        let result = try await api.perform(request: CreditsRequest(movie: movie))
        XCTAssertNotNil(result)
    }

}
