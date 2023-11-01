//
//  EnvironmentExtensions.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import Foundation
import SwiftUI

private struct MovieKey: EnvironmentKey {
    static var defaultValue: Movie? { nil }
}

extension EnvironmentValues {
    var selectedMovie: Movie? {
        get { self[MovieKey.self] }
        set { self[MovieKey.self] = newValue }
    }
}
