//
//  Item.swift
//  CS193p
//
//  Created by Kumaresh on 11/02/24.
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
