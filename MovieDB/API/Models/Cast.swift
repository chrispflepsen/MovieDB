//
//  Cast.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation

struct CreditsResponse: Decodable {
    let id: Int
    let cast: [CastMember]

    static var dummy: CreditsResponse? {
        let credits = try? AssetLoader.loadPreviewContent(name: "Credits", type: CreditsResponse.self)
        return credits
    }
}

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
