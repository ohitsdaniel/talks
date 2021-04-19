import ComposableArchitecture
import ComposableNavigator
import ComposableNavigatorTCA

struct SandwichOverviewScreen: Screen {
    let presentationStyle: ScreenPresentationStyle = .push

    struct Builder: NavigationTree {
        let store: Store<SandwichOverviewState, SandwichOverviewAction>

        var detailStore: Store<SandwichDetailState?, SandwichDetailAction> {
            store.scope(state: \.detail, action: SandwichOverviewAction.detail)
        }

        var builder: some PathBuilder {
            Screen(
                SandwichOverviewScreen.self,
                content: {
                    SandwichOverviewView(
                        store: store
                    )
                },
                nesting: {
                    PathBuilders.if(screen: { (screen: SandwichDetailScreen) in
                        PathBuilders.ifLetStore(
                            store: detailStore,
                            then: { store in
                                SandwichDetailScreen.Builder(store: store)
                            }
                        )
                        .beforeBuild {
                            ViewStore(store).send(.forceUpdateSandwich(with: screen.sandwichID))
                        }
                        .onDismiss(of: SandwichDetailScreen.self, perform: {
                            ViewStore(store).send(.dismissDetail)
                        })
                    })
                }
            )
        }
    }
}
