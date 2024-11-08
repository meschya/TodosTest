//
//  TodosTestApp.swift
//  TodosTest
//
//  Created by Egor Mesheryakov on 7.11.24.
//

import SwiftUI

@main
struct TodosTestApp: App {
    var body: some Scene {
        WindowGroup {
            FetchView(isWifiOn: false)
        }
    }
}
