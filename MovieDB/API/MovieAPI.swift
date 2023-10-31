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
    var headers: Headers? { guard let jsonAsset = NSDataAsset(name: "API") else { return [:] }
        let apiKey = (try? JSONDecoder().decode(APIConfig.self, from: jsonAsset.data).apiKey) ?? ""
        return [
            "Authorization": "Bearer \(apiKey)",
            "accept": "application/json"
        ]}
}

struct MovieAPI: API {
    var baseUrl: String { "https://api.themoviedb.org/3" }
    var defaults: RequestDefaults? = MovieDefaults()
    var decoder: JSONDecoder { .movieAPIDecoder }
}
