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
        List {
//            VStack(alignment: .leading,
//                   spacing: Constants.spacing) {
            Section {
                HStack {
                    Spacer()
                    MoviePosterView(posterSize: .detail(movie))
                        .frame(width: Constants.Images.detailSize.width,
                               height: Constants.Images.detailSize.height)
                    Spacer()
                }
            }
            .listRowSeparator(.hidden)
            Section {
                Text(movie.title)
                    .font(.title2)
                    .padding(.horizontal, Constants.padding)
                Text(movie.overview)
                    .font(.footnote)
                    .padding(.horizontal, Constants.padding)
            }
            .listRowSeparator(.hidden)
            Section(content: {
                CastView(movie: movie)
            }, header: {
                Text("Cast")
                    .font(.title3)
            })
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden, edges: .all)
    }
}

#Preview {
    MovieDetailView(movie: .popular.first!)
}
