//
//  AssetLoader.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import UIKit

enum AssetLoaderError: Error {
    case notFound
}

enum AssetLoader {
    static func loadJSONAsset<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let jsonAsset = NSDataAsset(name: name) else { throw AssetLoaderError.notFound }
        return try JSONDecoder().decode(T.self, from: jsonAsset.data)
    }

    static func loadPreviewContent<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            throw AssetLoaderError.notFound
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder.movieAPIDecoder.decode(type.self, from: data)
    }
}
