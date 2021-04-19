import ComposableArchitecture
import SwiftUI

@main
struct LiveCodingExampleAppApp: App {
    let appStore: Store<SandwichOverviewState, SandwichOverviewAction>

    init() {
        // TODO: Define datasource

        // TODO: Init navigator

        // TODO: Define deeplink handler

        appStore = Store(
            initialState: SandwichOverviewState(
                sandwiches: [
                    .danielsFavorite
                ] + (0..<20).map { _ in Sandwich.random() }
            ),
            reducer: sandwichOverviewReducer,
            environment: SandwichOverviewEnvironment()
        )
    }

    var body: some Scene {
        WindowGroup {
            // TODO: Use ComposableNavigator
            NavigationView {
                SandwichOverviewView(store: appStore)
            }
            // TODO: handle Deeplinks
        }
    }
}
