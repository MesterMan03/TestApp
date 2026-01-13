//
//  StartIntent.swift
//  Test
//
//  Created by m1 on 13/01/2026.
//

import AppIntents
import ActivityKit

struct ScanIntent: AppIntent {
    static var title: LocalizedStringResource = "Start Test Scan"
    static var description = IntentDescription("Starts a 10 second countdown")
    
    @MainActor
    func perform() async throws -> some IntentResult {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            throw NSError(domain: "LiveActivities", code: 1)
        }
        
        let attributes = TestActivityAttributes(name: "TestCountdown")
        let initialState = TestActivityAttributes.ContentState(message: "Starting...")
        let initialContent = ActivityContent(state: initialState, staleDate: nil)
        
        let activity = try Activity<TestActivityAttributes>.request(
            attributes: attributes,
            content: initialContent,
            pushType: nil
        )
        
        Task {
            for remaining in stride(from: 10, through: 1, by: -1) {
                try? await Task.sleep(nanoseconds: 1_000_000_000)
                let updatedState = TestActivityAttributes.ContentState(message: "Listening... \(remaining)s")
                let updatedContent = ActivityContent(state: updatedState, staleDate: nil)
                await activity.update(updatedContent)
            }
            
            let finalState = TestActivityAttributes.ContentState(message: "Done")
            let finalContent = ActivityContent(state: finalState, staleDate: nil)
            await activity.end(finalContent, dismissalPolicy: .immediate)
        }
        
        return .result()
    }
}
