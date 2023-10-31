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
    var state: MovieListState = .loading

    private let api = MovieAPI()
    private let networkConnector: NetworkConnector

    init(networkConnector: NetworkConnector = .shared) {
        self.networkConnector = networkConnector
    }

    func fetchMovies() async {
        self.state = .loading
        do {
            let response = try await api.perform(request: PopularMoviesRequest(),
                                               connector: networkConnector)
            self.state = .result(response.results)
        } catch let error {
            self.state = .error(error)
        }
    }
}
