//
//  ImageURLBuilder.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation

/// An enum for building URLs for various image resources, such as movie posters and cast member profiles.
enum ImageURLBuilder {

    /// Builds a URL for a movie poster image of a specific size.
    ///
    /// - Parameters:
    ///   - size: The poster size to use when constructing the URL.
    ///
    /// - Returns: A URL pointing to the movie poster image or `nil` if the URL construction fails.
    static func buildURLFor(size: PosterSize) -> URL? {
        return buildURLFor(baseUrl: Constants.Images.baseUrl,
                           sizePath: size.path,
                           imagePath: size.movie.posterPath)
    }

    /// Builds a URL for a cast member's profile image.
    ///
    /// - Parameters:
    ///   - castMember: The cast member for whom the profile image URL is constructed.
    ///
    /// - Returns: A URL pointing to the cast member's profile image or `nil` if the URL construction fails.
    static func buildURLFor(castMember: CastMember) -> URL? {
        return buildURLFor(baseUrl: Constants.Images.baseUrl,
                           sizePath: Constants.Images.profileSizePath,
                           imagePath: castMember.profilePath)
    }

    /// Builds a URL using the provided base URL, size path, and image path.
    ///
    /// - Parameters:
    ///   - baseUrl: The base URL for the image resource.
    ///   - sizePath: The path specifying the image size.
    ///   - imagePath: The path specifying the image file.
    ///
    /// - Returns: A URL constructed using the provided components or `nil` if the URL construction fails.
    static func buildURLFor(baseUrl: String, sizePath: String, imagePath: String) -> URL? {
        let urlString = "\(baseUrl)\(sizePath)\(imagePath)"
        return URL(string: urlString)
    }
}
