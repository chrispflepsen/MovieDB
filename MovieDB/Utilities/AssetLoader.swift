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

/// A utility structure for loading assets from the app's resources.
enum AssetLoader {
    /// Loads a JSON asset from the app's resources and decodes it into a specified type.
    ///
    /// - Parameters:
    ///   - name: The name of the JSON asset to be loaded.
    ///   - type: The type into which the JSON data should be decoded.
    ///
    /// - Throws:
    ///   - `AssetLoaderError.notFound` if the specified asset cannot be found.
    ///
    /// - Returns: An instance of the specified type containing the decoded JSON data.
    static func loadJSONAsset<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let jsonAsset = NSDataAsset(name: name) else { throw AssetLoaderError.notFound }
        return try JSONDecoder().decode(T.self, from: jsonAsset.data)
    }

    /// Loads preview content from the app's resources in JSON format and decodes it into a specified type.
    ///
    /// - Parameters:
    ///   - name: The name of the JSON asset to be loaded.
    ///   - type: The type into which the JSON data should be decoded.
    ///
    /// - Throws:
    ///   - `AssetLoaderError.notFound` if the specified asset cannot be found.
    ///
    /// - Returns: An instance of the specified type containing the decoded JSON data.
    static func loadPreviewContent<T: Decodable>(name: String, type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: name, withExtension: "json") else {
            throw AssetLoaderError.notFound
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder.movieAPIDecoder.decode(type.self, from: data)
    }
}
