//
//  JSONEncoderExtensions.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

extension JSONEncoder {
    static var movieAPIEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        return encoder
    }
}
