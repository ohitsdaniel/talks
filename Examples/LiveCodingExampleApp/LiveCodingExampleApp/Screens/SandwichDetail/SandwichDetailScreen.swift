import ComposableArchitecture
import ComposableNavigator

struct SandwichDetailScreen: Screen {
    let sandwichID: Sandwich.ID

    let presentationStyle: ScreenPresentationStyle = .push

    struct Builder: NavigationTree {
        let store: Store<SandwichDetailState, SandwichDetailAction>

        var builder: some PathBuilder {
            Screen(
                SandwichDetailScreen.self,
                content: { SandwichDetailView(store: store) }
            )
        }
    }
}
