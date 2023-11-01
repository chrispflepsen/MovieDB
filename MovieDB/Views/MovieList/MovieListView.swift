//
//  MovieListView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI

/// A `View` for displaying a list of movies.
struct MovieListView: View {

    var movies: [Movie]

    var body: some View {
        List(movies) { movie in
            NavigationLink(value: movie) {
                MovieView(movie: movie)
            }
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailView(movie: movie)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        MovieListView(movies: Movie.popular)
    }
}
