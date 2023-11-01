//
//  Movie.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

/// A struct representing a response containing movie results.
struct MovieResult: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
}

/// A struct representing a movie.
struct Movie: Identifiable, Hashable, Codable {
    let adult: Bool
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: Date
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
}

extension Movie {
    var releaseYear: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: releaseDate)
        return "\(year)"
    }
}
