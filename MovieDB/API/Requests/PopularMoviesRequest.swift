//
//  PopularMoviesRequest.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import RestySwift

/// an `APIRequest` that returns a list of the current most popular movies
struct PopularMoviesRequest: APIRequest {
    typealias Response = MovieResult

    var path: String { "/movie/popular" }
    var parameters: Parameters? { [
        "language": .single("en-US"),
        "page": .single("1")
    ] }
}
