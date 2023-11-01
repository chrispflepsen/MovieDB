//
//  LoadingView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI

/// A `View` that displays a loading indicator.
struct LoadingView: View {
    var body: some View {
        ProgressView()
    }
}

#Preview {
    LoadingView()
}
