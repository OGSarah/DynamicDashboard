//
//  LargeWidget.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI
import WidgetKit

struct LargeWidget: View {
    let entry: DashboardEntry
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Dashboard")
                    .font(.title2).bold()
                Spacer()
                Text(entry.date, style: .time)
                    .font(.caption)
            }

            Divider()

            HStack {
                Stat(icon: "sun.max.fill", value: "\(entry.temperature)°", label: "Weather")
                Stat(icon: "checklist", value: "\(entry.tasks)", label: "Tasks")
                Stat(icon: "figure.walk", value: "\(entry.steps)", label: "Steps")
            }

            Spacer()
        }
        .padding()
        .containerBackground(.fill.tertiary, for: .widget)
    }
}
