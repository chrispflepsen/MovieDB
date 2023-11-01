//
//  CastMemberView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI
import Kingfisher

/// A `View` that displays a single cast member.
struct CastMemberView: View {

    let castMember: CastMember

    var body: some View {
        HStack(alignment: .center) {
            KFImage.url(ImageURLBuilder.buildURLFor(castMember: castMember))
                .placeholder {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                        .opacity(0.3)
                }
                .fade(duration: Constants.Animation.duration)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Constants.Images.thumbnailSize.width,
                       height: Constants.Images.thumbnailSize.height)
            VStack(alignment: .leading,
                   spacing: Constants.spacing) {
                Text(castMember.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                Text(castMember.character)
                    .font(.subheadline)
            }
            .padding()
        }
    }
}

#Preview {
        CastMemberView(castMember: CastMember.castList.first!)
}
