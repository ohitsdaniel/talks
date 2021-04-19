import ComposableArchitecture
import ComposableDeeplinking
import ComposableNavigator
import SwiftUI

@main
struct LiveCodingExampleAppApp: App {
    let appStore: Store<SandwichOverviewState, SandwichOverviewAction>
    let dataSource: Navigator.Datasource

    var navigator: Navigator {
        Navigator(dataSource: dataSource)
    }

    var deeplinkHandler: DeeplinkHandler {
        DeeplinkHandler(navigator: navigator, parser: .app)
    }

    init() {
        // TODO: Define datasource
        dataSource = Navigator.Datasource(
            root: SandwichOverviewScreen()
        )

        // TODO: Define deeplink handler
        appStore = Store(
            initialState: SandwichOverviewState(
                sandwiches: [
                    .danielsFavorite
                ] + (0..<20).map { _ in Sandwich.random() }
            ),
            reducer: sandwichOverviewReducer,
            environment: SandwichOverviewEnvironment(
                navigator: Navigator(dataSource: dataSource).debug()
            )
        )
    }

    var body: some Scene {
        WindowGroup {
            // TODO: Use ComposableNavigator
            Root(
                dataSource: dataSource,
                navigator: navigator.debug(),
                pathBuilder: SandwichOverviewScreen.Builder(store: appStore)
            )
            .onOpenURL(
                perform: { url in
                    // the matching parameter needs to match the URL
                    // scheme defined in the application's project file
                    if let deeplink = Deeplink(url: url, matching: "yummy") {
                        deeplinkHandler.handle(deeplink: deeplink)
                    }
                }
            )

            // TODO: handle Deeplinks
        }
    }
}
