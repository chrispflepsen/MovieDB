//
//  CastView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import SwiftUI

struct CastView: View {

    let cast: [CastMember]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Cast")
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20, content: {
                    ForEach(cast) { castMember in
                        CastMemberView(castMember: castMember)
                    }
                })
            }
        }
        .padding()
    }
}

struct CastMemberView: View {

    let castMember: CastMember

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(castMember.profilePath)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                }
                // TODO: remove magic numbers and fix ratio
                .frame(width: 50, height: 75, alignment: .center)
                .padding()
                .background(Color.gray)
            }
            Text(castMember.name)
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Text(castMember.character)
                .font(.caption2)
            Spacer()
        }
        .frame(maxWidth: 75)
    }
}

#Preview {
    CastView(cast: CastMember.castList)
}
