//
//  MovieView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI
import Kingfisher

/// A `View` that displays a  single movie within a list, typically ``MovieListView``
struct MovieView: View {

    let movie: Movie

    var body: some View {
        HStack {
            MoviePosterView(posterSize: .thumbnail(movie))
                .frame(width: Constants.Images.thumbnailSize.width,
                       height: Constants.Images.thumbnailSize.height)
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title3)
                Text(movie.releaseYear)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    MovieView(movie: .popular.first!)
}
