//
//  DataProviders.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

@Observable
class MovieListStub: MovieListProvider {
    var state: MovieListState
    init(state: MovieListState) {
        self.state = state
    }

    func fetchMovies() async { }
}

@Observable
class CreditsStub: CreditsProvider {
    var creditsState: CreditViewState

    init(state: CreditViewState) {
        self.creditsState = state
    }

    func fetchCredits() async { }
}
