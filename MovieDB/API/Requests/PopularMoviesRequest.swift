//
//  PopularMoviesRequest.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import RestySwift

struct MovieResult: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    static var popular: MovieResult? {
        let popularMovies = try? AssetLoader.loadPreviewContent(name: "PopularMovies", type: MovieResult.self)
        return popularMovies
    }
}

struct Movie: Identifiable, Hashable, Decodable {
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

struct PopularMoviesRequest: APIRequest {
    typealias Response = MovieResult

    var path: String { "/movie/popular" }
    var parameters: Parameters? { [
        "language": .single("en-US"),
        "page": .single("1")
    ] }

}
