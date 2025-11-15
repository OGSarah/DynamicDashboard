//
//  DashboardWidgetView.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI
import WidgetKit

struct DashboardWidgetEntryView: View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family

    var body: some View {
        switch family {
        case .systemSmall: SmallWidget(entry: entry)
        case .systemMedium: MediumWidget(entry: entry)
        case .systemLarge: LargeWidget(entry: entry)
        default: Text("Unsupported")
        }
    }

}
