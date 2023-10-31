//
//  MovieListView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

/// A `View` that manages the entire state of a ``MovieListView`` including loading and errors
struct MovieListContainerView: View {

    var movieList: MovieListProvider = MovieListViewModel()

    var body: some View {
        VStack {
            switch movieList.state {
            case .loading:
                LoadingView()
            case .result(let movies):
                MovieListView(movies: movies)
            case .error(let error):
                ErrorView(error: error) {
                    Task {
                        await movieList.fetchMovies()
                    }
                }
            }
        }
        .navigationTitle("Popular Movies")
        .task {
            await movieList.fetchMovies()
        }
    }
}

#Preview {
    NavigationStack {
        MovieListContainerView(movieList: MovieListStub(state: .result(Movie.popular)))
    }
}

#Preview {
    NavigationStack {
        MovieListContainerView(movieList: MovieListStub(state: .loading))
    }
}

#Preview {
    NavigationStack {
        MovieListContainerView(movieList: MovieListStub(state: .error(PreviewError.generic)))
    }
}
