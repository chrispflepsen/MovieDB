//
//  CastMemberPreviewExtensions.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation

extension CastMember {
    static var castList: [CastMember] {
        guard let credits = try? AssetLoader.loadPreviewContent(name: "Credits", type: CreditsResponse.self) else {
            return []
        }
        return credits.cast
    }
}
