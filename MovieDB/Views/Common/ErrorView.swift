//
//  ErrorView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI

/// A `View` that displays an error message and provides an action to retry.
struct ErrorView: View {

    /// The error to be handled.
    private var error: Error
    /// The action to be executed when the user taps to retry.
    private var action: () -> Void

    /// Initializes an ErrorView with the provided error and action closure.
    ///
    /// - Parameters:
    ///   - error: The error to be displayed.
    ///   - action: A closure to be executed when the user taps to retry.
    init(error: Error, action: @escaping () -> Void) {
        self.error = error
        self.action = action
    }

    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName: "xmark.octagon")
                    .resizable()
                    .frame(width: Constants.Images.iconSize.width,
                           height: Constants.Images.iconSize.height)
                Text(Constants.Text.defaultError)
                    .font(.title3)
            }
            .foregroundStyle(.red)
        })
    }
}

#Preview {
    ErrorView(error: PreviewError.generic, action: { })
}
