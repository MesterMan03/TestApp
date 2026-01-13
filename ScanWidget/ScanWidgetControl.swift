//
//  ScanWidgetControl.swift
//  ScanWidget
//
//  Created by m1 on 13/01/2026.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ScanWidgetControl: ControlWidget {
    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: "info.mester.Test.ScanWidget",
            provider: ScanControlProvider()
        ) { value in
            ControlWidgetButton(action: ScanIntent()) {
                Label("Scan", systemImage: "dot.radiowaves.left.and.right")
            }
        }
        .displayName("Test Scan")
        .description("Start a 10 second countdown with Live Activity")
    }
}

struct ScanControlProvider: AppIntentControlValueProvider {
    func currentValue(configuration: ScanControlConfiguration) async throws -> Bool {
        return false
    }
    
    func previewValue(configuration: ScanControlConfiguration) -> Bool {
        return false
    }
}

struct ScanControlConfiguration: ControlConfigurationIntent {
    static var title: LocalizedStringResource = "Test Scan Control"
}
