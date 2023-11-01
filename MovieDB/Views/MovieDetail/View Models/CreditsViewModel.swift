//
//  CreditsViewModel.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation
import RestySwift

enum CreditViewState {
    case loading
    case result([CastMember])
    case error(Error)
}

protocol CreditsProvider: Observable {
    var creditsState: CreditViewState { get }
    func fetchCredits() async
}

@Observable
class CreditsViewModel: CreditsProvider {
    private(set) var creditsState: CreditViewState = .loading
    private(set) var movie: Movie

    private let api = MovieAPI()
    private let connector: NetworkConnector

    init(movie: Movie,
         connector: NetworkConnector = .shared) {
        self.movie = movie
        self.connector = connector
        Task {
            await fetchCredits()
        }
    }

    func fetchCredits() async {
        creditsState = .loading
        do {
            let result = try await api.perform(request: CreditsRequest(movie: movie),
                                                connector: connector)
            creditsState = .result(result.cast)
        } catch let error {
            creditsState = .error(error)
        }
    }
}
