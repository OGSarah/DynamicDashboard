//
//  Stat.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import SwiftUI

struct Stat: View {
    let icon: String
    let value: String
    let label: String
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title3)
            Text(value)
                .font(.headline)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}
