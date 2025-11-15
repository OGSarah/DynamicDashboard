//
//  TaskRow.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI

struct TaskRow: View {
    var task: Task

    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(task.isCompleted ? .green : .secondary)
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            Text(task.title)
            Spacer()
            if let date = task.dueDate {
                Text(date, style: .relative)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }

}
