//
//  CreditsViewModelTests.swift
//  MovieDBTests
//
//  Created by Chris Pflepsen on 10/31/23.
//

import XCTest
@testable import MovieDB

final class CreditsViewModelTests: XCTestCase {

    func testFetchCastMembers() async throws {
        let viewModel = CreditsViewModel(movie: Movie.popular.first!,
                                         connector: .single(.success(CreditsResponse(id: 1,
                                                                                     cast: CastMember.castList))))
        await viewModel.fetchCredits()
        switch viewModel.creditsState {
        case .result(let cast):
            XCTAssertNotNil(cast)
            XCTAssert(cast.count > 0)
        default:
            XCTFail("Cast list should be loaded in the view model")
        }
    }

    func testFetchCastMembersError() async throws {
        let viewModel = CreditsViewModel(movie: Movie.popular.first!,
                                         connector: .single(.error(PreviewError.generic)))
        await viewModel.fetchCredits()
        switch viewModel.creditsState {
        case .error(let error):
            XCTAssertNotNil(error)
        default:
            XCTFail("Network should have returned an error")
        }
    }

}
