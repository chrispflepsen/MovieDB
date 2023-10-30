//
//  Item.swift
//  MovieDB
//
//  Created by Chris Pflepsen on 10/30/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
