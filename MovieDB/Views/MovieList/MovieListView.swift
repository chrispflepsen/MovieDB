//
//  MovieListView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

protocol MovieListModel: Observable {
    var movies: [Movie] { get set }
}

@Observable
class MovieList: MovieListModel {
    var movies: [Movie] = []

    private let api = MovieAPI()

    init() {
        Task {
            await fetchPopularMovies()
        }
    }

    private func fetchPopularMovies() async {
        do {
            let result = try await api.perform(request: PopularMoviesRequest())
            self.movies = result.results
        } catch let error {
            // TODO: handle error
        }
    }
}

struct MovieListView: View {

    @State var searchText = ""
    var movieList: MovieListModel = MovieList()

    var body: some View {
        List(movieList.movies) { movie in
            NavigationLink(value: movie) {
                MovieView(movie: movie)
            }
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailView(movie: movie)
        }
        .searchable(text: $searchText)
    }
}

struct MovieView: View {

    let movie: Movie

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)"),
                       scale: 1.0) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 50)
            } placeholder: {
                Image(systemName: "film")
            }

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title3)
                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

        }
    }
}

@Observable
class MovieListStub: MovieListModel {

    var movies: [Movie]

    init() {
        let movieResult = try? AssetLoader.loadPreviewContent(name: "PopularMovies", type: MovieResult.self)
        self.movies = movieResult?.results ?? []
    }
}

#Preview {
    NavigationStack {
        MovieListView(movieList: MovieListStub())
    }
}
