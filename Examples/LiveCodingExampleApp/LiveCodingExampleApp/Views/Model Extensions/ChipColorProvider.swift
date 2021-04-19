import SwiftUI

struct ChipColorConfiguration {
    let foreground: Color
    let background: Color
}

struct ChipColorProvider {
    private let breadColor: (Bread) -> ChipColorConfiguration
    private let ingredientColor: (Ingredient) -> ChipColorConfiguration
    private let spreadColor: (Spread) -> ChipColorConfiguration

    init(
        colorFor bread: @escaping (Bread) -> ChipColorConfiguration,
        colorFor ingredient: @escaping (Ingredient) -> ChipColorConfiguration,
        colorFor spread: @escaping (Spread) -> ChipColorConfiguration
    ) {
        self.breadColor = bread
        self.ingredientColor = ingredient
        self.spreadColor = spread
    }

    func colorConfiguration(for content: ChipView.Content) -> ChipColorConfiguration {
        switch content {
        case .bread(let bread):
            return breadColor(bread)
        case .ingredient(let ingredient):
            return ingredientColor(ingredient)
        case .spread(let spread):
            return spreadColor(spread)
        }
    }
}

extension ChipColorProvider {
    static let theme = ChipColorProvider(
        colorFor: { bread in
            let foreground: Color
            let background: Color

            switch bread {
            case .toast, .ciabatta, .wholegrain:
                foreground = .black
            }

            switch bread {
            case .toast:
                background = .red
            case .ciabatta:
                background = .green
            case .wholegrain:
                background = .orange
            }

            return ChipColorConfiguration(
                foreground: foreground,
                background: background
            )
        },
        colorFor: { ingredient in
            let foreground: Color
            let background: Color

            switch ingredient {
            case .tomato, .salad, .cheese, .tofu:
                foreground = .black
            }

            switch ingredient {
            case .tomato:
                background = .red
            case .salad:
                background = .green
            case .cheese:
                background = .yellow
            case .tofu:
                background = .gray
            }

            return ChipColorConfiguration(
                foreground: foreground,
                background: background
            )
        },
        colorFor: { spread in
            let foreground: Color
            let background: Color

            switch spread {
            case .butter, .hazelnutChocolate, .hummus:
                foreground = .black
            }

            switch spread {
            case .butter:
                background = .gray
            case .hazelnutChocolate:
                background = .orange
            case .hummus:
                background = .blue
            }

            return ChipColorConfiguration(
                foreground: foreground,
                background: background
            )
        }
    )
}
