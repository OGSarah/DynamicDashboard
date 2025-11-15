//
//  WidgetProvider.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftData
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    typealias Entry = DashboardEntry

    func placeholder(in context: Context) -> Entry {
        Entry(date: Date(), steps: 8500, tasks: 3, temperature: 22)
    }

    func getSnapshot(in context: Context, completion: @escaping (Entry) -> ()) {
        let entry = Entry(date: Date(), steps: 8500, tasks: 3, temperature: 22)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            let steps = 8500
            let tasks = await fetchTaskCount()
            let temp = await fetchWeather()

            let entry = Entry(date: Date(), steps: steps, tasks: tasks, temperature: temp)
            let nextUpdate = Date().addingTimeInterval(900)
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdate))
            completion(timeline)
        }
    }

    // FIXED: Use Task.self, not DynamicDashboard.Task
    private func fetchTaskCount() async -> Int {
        do {
            let container = try sharedContainer()
            let context = container.mainContext
            let descriptor = FetchDescriptor<Task>(predicate: #Predicate { $0.isCompleted == false })
            return try context.fetchCount(descriptor)
        } catch {
            print("SwiftData error: \(error)")
            return 0
        }
    }

    private func fetchWeather() async -> Int {
        return Int.random(in: 18...28)
    }

    // FIXED: Use Task.self
    private func sharedContainer() throws -> ModelContainer {
        let appGroupID = "group.com.yourname.dynamicdashboard"

        guard let baseURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupID) else {
            throw NSError(domain: "Provider", code: 1, userInfo: [NSLocalizedDescriptionKey: "App Group not found: \(appGroupID)"])
        }

        let storeURL = baseURL.appendingPathComponent("dynamicdashboard.sqlite")
        let config = ModelConfiguration(url: storeURL)
        return try ModelContainer(for: Task.self, configurations: config) // Task.self
    }
}
