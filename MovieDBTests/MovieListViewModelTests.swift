//
//  MovieListViewModelTests.swift
//  MovieDBTests
//
//  Created by Chris Pflepsen on 10/31/23.
//

import XCTest
import RestySwift
@testable import MovieDB

final class MovieListViewModelTests: XCTestCase {

    func testFetchMovies() async throws {
        let viewModel = MovieListViewModel(connector: .single(.success(MovieResult.popular)))
        await viewModel.fetchMovies()
        switch viewModel.state {
        case .result(let movies):
            XCTAssertNotNil(movies)
            XCTAssert(movies.count > 0)
        default:
            XCTFail("Movies should be loaded in the view model")
        }
    }

    func testFetchMoviesError() async throws {
        let viewModel = MovieListViewModel(connector: .single(.error(PreviewError.generic)))
        await viewModel.fetchMovies()
        switch viewModel.state {
        case .error(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail("Network should have returned an error")
        }
    }

}
