//
//  ImageURLBuilder.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation

enum ImageURLBuilder {
    static func buildURLFor(imagePath: String) -> URL? {
        let api = MovieAPI()
        return URL(string: "\(api.baseUrl)\(imagePath)")
    }
}
