//
//  MediumWidget.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI
import WidgetKit

struct MediumWidget: View {
    let entry: DashboardEntry
    var body: some View {
        HStack(spacing: 16) {
            Stat(icon: "sun.max.fill", value: "\(entry.temperature)°", label: "Weather")
            Stat(icon: "checklist", value: "\(entry.tasks)", label: "Tasks")
            Stat(icon: "figure.walk", value: "\(entry.steps)", label: "Steps")
        }
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
    }
}
