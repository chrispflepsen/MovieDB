//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: Movie

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 250)

                } placeholder: {
                    Image(systemName: "film")
                }
                Spacer()
            }
            Text(movie.title)
                .font(.title3)
                .padding(.horizontal, 16)
            Text(movie.overview)
                .font(.footnote)
                .padding(.horizontal, 16)
        }
    }
}

#Preview {
    MovieDetailView(movie: (MovieResult.popular?.results.first)!)
}
