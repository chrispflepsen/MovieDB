//
//  PosterSize.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

/// An enum representing the availible sizes for movie posters.
enum PosterSize {
    case thumbnail(Movie)
    case detail(Movie)
    case full(Movie)

    var movie: Movie {
        switch self {
        case .thumbnail(let movie), .detail(let movie), .full(let movie):
            return movie
        }
    }

    /// The path segment for this sized poster
    var path: String {
        switch self {
        case .thumbnail:
            return "/w185"
        case .detail:
            return "/w500"
        case .full:
            return "/original"
        }
    }
}
