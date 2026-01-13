//
//  ScanWidgetBundle.swift
//  ScanWidget
//
//  Created by m1 on 13/01/2026.
//

import WidgetKit
import SwiftUI

@main
struct ScanWidgetBundle: WidgetBundle {
    var body: some Widget {
        ScanWidgetControl()
        ScanWidgetLiveActivity()
    }
}
