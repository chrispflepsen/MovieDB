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
        VStack(alignment: .center) {
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
            Text(castMember.name)
                .font(.caption)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Text(castMember.character)
                .font(.caption2)
        }
        .frame(maxWidth: 80, maxHeight: .infinity)
    }
}

#Preview {
    CastMemberView(castMember: CastMember.castList.first!)
}
