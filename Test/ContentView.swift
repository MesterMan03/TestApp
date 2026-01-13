//
//  ContentView.swift
//  Test
//
//  Created by m1 on 13/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var result = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, World!")
            
            Button("Test Scan Intent") {
                Task {
                    let intent = ScanIntent()
                    do {
                        let outcome = try await intent.perform()
                        
                        result = "Success!"
                    } catch {
                        result = "Error: \(error.localizedDescription)"
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text(result)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
