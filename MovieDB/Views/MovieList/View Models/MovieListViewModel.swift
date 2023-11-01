//
//  MovieListViewModel.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation
import RestySwift

/// An enumeration representing the state of a movie list
enum MovieListState {
    case loading
    case result([Movie])
    case error(Error)
}

/// The `MovieListProvider` protocol defines the requirements for providing and managing movie list data.
protocol MovieListProvider: Observable {
    var state: MovieListState { get }
    func fetchMovies() async
}

@Observable
class MovieListViewModel: MovieListProvider {
    private(set) var state: MovieListState = .loading

    private let api = MovieAPI()
    private let connector: NetworkConnector

    init(connector: NetworkConnector = .shared) {
        self.connector = connector
        Task {
            await fetchMovies()
        }
    }

    func fetchMovies() async {
        self.state = .loading
        do {
            let response = try await api.perform(request: PopularMoviesRequest(),
                                                 connector: connector)
            self.state = .result(response.results.filter { $0.adult == false })
        } catch let error {
            self.state = .error(error)
        }
    }
}
