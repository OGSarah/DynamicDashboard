//
//  Item.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
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
