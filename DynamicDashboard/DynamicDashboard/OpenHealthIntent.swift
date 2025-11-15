//
//  OpenHealthIntent.swift
//  DynamicDashboard
//
//  Created by Sarah Clark on 11/14/25.
//

import AppIntents

struct OpenHealthIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Health"
    static var openAppWhenRun: Bool = true

    func perform() async throws -> some IntentResult {
        return .result()
    }
}
