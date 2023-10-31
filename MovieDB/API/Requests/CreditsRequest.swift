//
//  CreditsRequest.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import RestySwift

/// an `APIRequest` that returns the credits for a movie
struct CreditsRequest: APIRequest {
    typealias Response = CreditsResponse
    var path: String { "/movie/\(movie.id)/credits" }
    let movie: Movie
}
