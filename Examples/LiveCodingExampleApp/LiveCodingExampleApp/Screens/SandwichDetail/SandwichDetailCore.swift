import ComposableArchitecture

struct SandwichDetailState: Equatable {
    let sandwich: Sandwich
}

enum SandwichDetailAction: Equatable {}

struct SandwichDetailEnvironment {}


let sandwichDetailReducer = Reducer<
    SandwichDetailState,
    SandwichDetailAction,
    SandwichDetailEnvironment
>.empty

