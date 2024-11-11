import SwiftUI

@main
struct TodosTestApp: App {
    var body: some Scene {
        WindowGroup {
            FetchView(isWifiOn: false, isShowResults: false, isToggle: false)
        }
    }
}
