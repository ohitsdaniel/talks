import ComposableArchitecture
import SwiftUI

let appStore: Store<SandwichOverviewState, SandwichOverviewAction> = {
    Store<SandwichOverviewState, SandwichOverviewAction>(
        initialState: SandwichOverviewState(
            sandwiches: [
                .danielsFavorite
            ] + (0..<20).map { _ in Sandwich.random() }
        ),
        reducer: sandwichOverviewReducer,
        environment: SandwichOverviewEnvironment()
    )
}()

@main
struct LiveCodingExampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SandwichOverviewView(store: appStore)
            }
        }
    }
}
