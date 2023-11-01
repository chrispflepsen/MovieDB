//
//  Constants.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation

/// A collection of constants used throughout the application.
enum Constants {
    /// 8.0
    static let spacing = 8.0
    /// 16.0
    static let padding = 16.0

    enum Images {
        static let baseUrl = "https://image.tmdb.org/t/p"
        static let profileSizePath = "/w185"

        static let thumbnailSize = CGSize(width: 50, height: 75)
        static let detailSize = CGSize(width: 250, height: 375)
    }

    enum Animation {
        /// 0.25
        static let duration = 0.25
    }
}
