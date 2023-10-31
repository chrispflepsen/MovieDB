//
//  MovieListViewModelTests.swift
//  MovieDBTests
//
//  Created by Chris Pflepsen on 10/31/23.
//

import XCTest
@testable import MovieDB

final class MovieListViewModelTests: XCTestCase {

    func testFetchMovies() async throws {
        let viewModel = MovieListViewModel(networkConnector: .single(.success(MovieResult.popular)))
        await viewModel.fetchMovies()
        switch viewModel.state {
        case .result(let movies):
            XCTAssertNotNil(movies)
            XCTAssert(movies.count > 0)
        default:
            XCTFail("Movies should be loaded in the view model")
        }
    }

    func testLoading() async throws {
        let viewModel = MovieListViewModel(networkConnector: .single(.success(MovieResult.popular)))
        switch viewModel.state {
        case .loading:
            break
        default:
            XCTFail("View model should stay in the loading state until `fetchMovies` is called")
        }
    }

    func testError() async throws {
        let viewModel = MovieListViewModel(networkConnector: .single(.error(PreviewError.generic)))
        await viewModel.fetchMovies()
        switch viewModel.state {
        case .error(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail("Network should have returned an error")
        }
    }

}
