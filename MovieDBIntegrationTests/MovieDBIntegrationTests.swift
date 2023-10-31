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

    func testPopularEndpoint() async throws {
        let result = try await api.perform(request: PopularMoviesRequest())
        XCTAssertNotNil(result)
    }

    func testCreditsEndpoint() async throws {
        let movie = (Movie.popular.first)!
        let result = try await api.perform(request: CreditsRequest(movie: movie))
        XCTAssertNotNil(result)
    }

}
