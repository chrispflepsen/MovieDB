//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI
import SwiftData

@main
struct MovieDBApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListContainerView()
            }
        }
    }
}

struct MovieSplitView: View {

    // TODO: Configure a split view to work on iPad, the environment var will break DI and previews
    @Environment(\.selectedMovie) var selectedMovie: Movie?

    var body: some View {
        NavigationSplitView {
            MovieListContainerView()
        } detail: {
            if let selectedMovie = selectedMovie {
                MovieDetailView(movie: selectedMovie)
            } else {
                Text("Please select a movie")
                    .font(.title)
            }

        }

    }
}
