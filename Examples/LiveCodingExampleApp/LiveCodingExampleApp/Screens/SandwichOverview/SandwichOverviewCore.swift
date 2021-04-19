import ComposableArchitecture
import ComposableNavigator

struct SandwichOverviewState: Equatable {
    var sandwiches: [Sandwich]

    var selectedSandwich: Sandwich.ID?

    var detail: SandwichDetailState? {
        get {
            guard let selectedSandwich = selectedSandwich else {
                return nil
            }

            return sandwiches
                .first(where: { $0.id == selectedSandwich })
                .map(SandwichDetailState.init)
        }
        set {
            selectedSandwich = newValue?.sandwich.id
        }
    }
}

enum SandwichOverviewAction: Equatable {
    case selectSandwich(with: Sandwich.ID, on: ScreenID)

    case forceUpdateSandwich(with: Sandwich.ID)
    case dismissDetail

    case detail(SandwichDetailAction)
}

struct SandwichOverviewEnvironment {
    let navigator: Navigator

    var detail: SandwichDetailEnvironment {
        SandwichDetailEnvironment()
    }
}

let sandwichOverviewReducer = Reducer<
    SandwichOverviewState,
    SandwichOverviewAction,
    SandwichOverviewEnvironment
> { state, action, environment in
    switch action {
    case let .selectSandwich(with: id, on: screenID):
        state.selectedSandwich = id

        return .fireAndForget {
            environment.navigator.go(
                to: SandwichDetailScreen(sandwichID: id),
                on: screenID
            )
        }

    case .forceUpdateSandwich(with: let id):
        state.selectedSandwich = id
        return .none
        
    case .dismissDetail:
        state.selectedSandwich = nil
        return .none

    case .detail:
        return .none
    }
}
.combined(
    with: sandwichDetailReducer.optional().pullback(
        state: \.detail,
        action: /SandwichOverviewAction.detail,
        environment: \.detail
    )
)
.debug()
