//
//  MoviePosterView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI
import Kingfisher

/// A `View` that asyncronously downloads and displays a movie poster with a specified size.
struct MoviePosterView: View {

    let posterSize: PosterSize

    var body: some View {
        KFImage.url(ImageURLBuilder.buildURLFor(size: posterSize))
            .placeholder {
                Image(systemName: "film")
                    .font(.largeTitle)
                    .opacity(0.3)
            }
            .fade(duration: Constants.Animation.duration)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    MoviePosterView(posterSize: .detail(.popular.first!) )
        .frame(width: Constants.Images.detailSize.width,
               height: Constants.Images.detailSize.height)
}
