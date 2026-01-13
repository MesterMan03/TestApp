//
//  IntentProvider.swift
//  Test
//
//  Created by m1 on 13/01/2026.
//

import AppIntents

struct IntentProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(intent: ScanIntent(), phrases: ["Start test scan ${applicationName}"], shortTitle: "Test scan", systemImageName: "dot.radiowaves.left.and.right")
    }
}
