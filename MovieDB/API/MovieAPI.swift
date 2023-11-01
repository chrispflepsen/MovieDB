//
//  MovieAPI.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import RestySwift
import UIKit

struct APIConfig: Codable {
    let apiKey: String
}

private struct MovieDefaults: RequestDefaults {
    var parameters: Parameters?
    var headers: Headers? {
        guard let apiConfig = try? AssetLoader.loadJSONAsset(name: "API", type: APIConfig.self) else { return [:] }
        return [
            "Authorization": "Bearer \(apiConfig.apiKey)",
            "accept": "application/json"
        ]}
}

/// A struct representing the configuration for the movie API.
struct MovieAPI: API {
    var baseUrl: String { "https://api.themoviedb.org/3" }
    var defaults: RequestDefaults? = MovieDefaults()
    var decoder: JSONDecoder { .movieAPIDecoder }
    var encoder: JSONEncoder { .movieAPIEncoder }
}
