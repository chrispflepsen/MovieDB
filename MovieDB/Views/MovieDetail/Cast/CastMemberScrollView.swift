//
//  CastMemberScrollView.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/31/23.
//

import SwiftUI

/// A horizontally scrolling `ScrollView` displaying the profile image, name, and character name of the performers
struct CastMemberScrollView: View {

    let cast: [CastMember]

    var body: some View {
        List(cast) { castMember in
            CastMemberView(castMember: castMember)
        }
    }

}

#Preview {
    CastMemberScrollView(cast: CastMember.castList)
}
