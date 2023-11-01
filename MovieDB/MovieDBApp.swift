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
