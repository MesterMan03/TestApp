//
//  TestActivityAttributes.swift
//  Test
//
//  Created by m1 on 13/01/2026.
//

import ActivityKit

struct TestActivityAttributes: ActivityAttributes {
    var name: String
    public struct ContentState: Codable, Hashable {
        var message: String
    }
}
