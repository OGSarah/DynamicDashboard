//
//  DashboardWidget.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftData
import SwiftUI
import WidgetKit

struct DashboardWidget: Widget {
    let kind: String = "DashboardWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            DashboardWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Dynamic Dashboard")
        .description("Live health, tasks, and weather.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }

    private func sharedContainer() throws -> ModelContainer {
        let appGroupID = "group.com.yourname.dynamicdashboard"
        let url = URL(fileURLWithPath: "/private/var/mobile/Containers/Shared/AppGroup")
            .appendingPathComponent(appGroupID)
            .appendingPathComponent("dynamicdashboard.sqlite")

        let config = ModelConfiguration(url: url)
        return try ModelContainer(for: Task.self, configurations: config)
    }

}
