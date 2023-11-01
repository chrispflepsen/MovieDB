//
//  CastView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

/// A View that displays a list of cast members for a movie or show.
struct CastView: View {

    var creditsViewModel: CreditsProvider

    init(movie: Movie) {
        self.creditsViewModel = CreditsViewModel(movie: movie)
    }

    init(creditsProvider: CreditsProvider) {
        self.creditsViewModel = creditsProvider
    }

    var body: some View {
        switch creditsViewModel.creditsState {
        case .loading:
            HStack {
                Spacer()
                LoadingView()
                Spacer()
            }
        case .result(let cast):
            LazyVStack(alignment: .leading,
                       content: {
                ForEach(cast) { castMember in
                    CastMemberView(castMember: castMember)
                }
            })
        case .error(let error):
            HStack {
                Spacer()
                ErrorView(error: error) {
                    Task {
                        await creditsViewModel.fetchCredits()
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CastView(creditsProvider: CreditsStub(state: .result(CastMember.castList)))
}

#Preview {
    CastView(creditsProvider: CreditsStub(state: .loading))
}

#Preview {
    CastView(creditsProvider: CreditsStub(state: .error(PreviewError.generic)))
}
