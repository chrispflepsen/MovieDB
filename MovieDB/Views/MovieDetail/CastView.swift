//
//  CastView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

/// A View that displays a list of cast members for a movie or show.
struct CastView: View {

    let cast: [CastMember]

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("Cast")
                .font(.title)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top,
                           spacing: Constants.spacing,
                           content: {
                    ForEach(cast) { castMember in
                        CastMemberView(castMember: castMember)
                    }
                })
                .padding(.horizontal, Constants.padding)
            }
            Spacer()
        }
        .padding(.vertical, Constants.padding)
    }
}

#Preview {
    CastView(cast: CastMember.castList)
}
