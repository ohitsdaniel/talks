import Foundation

struct ChipLocalisationProvider {
    private let breadName: (Bread) -> String
    private let ingredientName: (Ingredient) -> String
    private let spreadName: (Spread) -> String

    func name(for content: ChipView.Content) -> String {
        switch content {
        case .bread(let bread):
            return breadName(bread)
        case .ingredient(let ingredient):
            return ingredientName(ingredient)
        case .spread(let spread):
            return spreadName(spread)
        }
    }
}

extension ChipLocalisationProvider {
    static let fixed = ChipLocalisationProvider(
        breadName: { bread in
            switch bread {
            case .ciabatta:
                return "Ciabatta"
            case .toast:
                return "Toast"
            case .wholegrain:
                return "Wholegrain"
            }
        },
        ingredientName: { ingredient in
            switch ingredient {
            case .tofu:
                return "Tofu"
            case .salad:
                return "Fresh salad"
            case .tomato:
                return "Sun-dried tomatoes"
            case .cheese:
                return "Cashew cheese"
            }
        },
        spreadName: { spread in
            switch spread {
            case .butter:
                return "Bvtter"
            case .hazelnutChocolate:
                return "Not-ella"
            case .hummus:
                return "Hummus"
            }
        }
    )
}
