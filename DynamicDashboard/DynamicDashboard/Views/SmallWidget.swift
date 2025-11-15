//
//  SmallWidget.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI
import WidgetKit

struct SmallWidget: View {
    let entry: DashboardEntry
    var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .font(.title2)
            Text("\(entry.steps)")
                .font(.headline)
            Text("steps")
                .font(.caption2)
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}
