//
//  Cast.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation

/// A struct representing the response for movie credits, including cast members.
struct CreditsResponse: Decodable {
    let id: Int
    let cast: [CastMember]
}

/// A struct representing a cast member in a movie or TV show.
struct CastMember: Identifiable, Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Float
    let profilePath: String
    let castId: Int
    let character: String
    let creditId: String
    let order: Int
}
