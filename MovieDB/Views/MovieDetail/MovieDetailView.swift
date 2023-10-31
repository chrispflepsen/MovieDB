//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

/// A `View` that displays extended details for a movie.
struct MovieDetailView: View {

    let movie: Movie

    var body: some View {
        VStack(alignment: .leading,
               spacing: Constants.spacing) {
            HStack {
                Spacer()
                MoviePosterView(posterSize: .detail(movie))
                    .frame(width: Constants.Images.detailSize.width,
                                 height: Constants.Images.detailSize.height)
                Spacer()
            }
            Text(movie.title)
                .font(.title2)
                .padding(.horizontal, Constants.padding)
            Text(movie.overview)
                .font(.footnote)
                .padding(.horizontal, Constants.padding)
//            CastView(cast: <#T##[CastMember]#>)
            Spacer()
        }
    }
}

#Preview {
    MovieDetailView(movie: .popular.first!)
}
