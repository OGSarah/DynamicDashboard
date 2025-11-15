//
//  Task.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import Foundation
import SwiftData

@Model
final class Task {
    var title: String
    var isCompleted: Bool
    var dueDate: Date?

    init(title: String, isCompleted: Bool = false, dueDate: Date? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
}
