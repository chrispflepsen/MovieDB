//
//  MoviePreviewExtensions.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

extension MovieResult {
    static var popular: MovieResult {
        return MovieResult(page: 1, results: Movie.popular, totalPages: 1, totalResults: 20)
    }
}

extension Movie {
    static var popular: [Movie] {
        let popularMovies = try? AssetLoader.loadPreviewContent(name: "PopularMovies", type: MovieResult.self)
        return popularMovies?.results ?? []
    }
}
