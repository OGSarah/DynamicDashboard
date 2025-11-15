//
//  ContentView.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Task.dueDate, order: .forward, animation: .default)
    private var tasks: [Task]

    @State private var health = HealthManager()
    @State private var newTaskTitle = ""

    var pendingTasks: [Task] {
        tasks.filter { !$0.isCompleted }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Health") {
                    HStack {
                        Image(systemName: "flame.fill")
                            .foregroundStyle(.orange)
                        Text("\(health.steps) steps")
                        Spacer()
                        Text("\(health.calories, specifier: "%.0f") kcal")
                    }
                }

                Section("Tasks") {
                    ForEach(pendingTasks) { task in
                        TaskRow(task: task)
                    }
                    .onDelete(perform: deleteTasks)

                    HStack {
                        TextField("New task", text: $newTaskTitle)
                        Button("Add") {
                            addTask()
                        }
                        .disabled(newTaskTitle.isEmpty)
                    }
                }
            }
            .navigationTitle("Dynamic Dashboard")
            .toolbar {
                EditButton()
            }
        }
    }

    // MARK: Private functions
    private func addTask() {
        withAnimation {
            let task = Task(title: newTaskTitle, dueDate: Date().addingTimeInterval(3600))
            modelContext.insert(task)
            newTaskTitle = ""
        }
    }

    private func deleteTasks(at offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(pendingTasks[index])
            }
        }
    }

}

#Preview("Light Mode") {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
        .preferredColorScheme(.dark)
}
