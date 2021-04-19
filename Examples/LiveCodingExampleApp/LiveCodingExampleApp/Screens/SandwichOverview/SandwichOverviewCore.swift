import ComposableArchitecture

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
    case selectSandwich(with: Sandwich.ID)

    case detail(SandwichDetailAction)
}

struct SandwichOverviewEnvironment {
    var detail: SandwichDetailEnvironment {
        SandwichDetailEnvironment()
    }
}

let sandwichOverviewReducer = Reducer<
    SandwichOverviewState,
    SandwichOverviewAction,
    SandwichOverviewEnvironment
> { state, action, environment in
    return .none
}
.combined(
    with: sandwichDetailReducer.optional().pullback(
        state: \.detail,
        action: /SandwichOverviewAction.detail,
        environment: \.detail
    )
)
