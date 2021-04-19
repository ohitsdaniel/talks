import Foundation
import Tagged

struct Sandwich: Equatable, Identifiable {
    typealias ID = Tagged<Sandwich, String>

    let id: ID

    let bread: Bread
    let ingredients: [Ingredient]
    let spread: Spread
}

extension Sandwich {
    static var randomCount = 1

    static let danielsFavorite = Sandwich(
        id: "0",
        bread: .ciabatta,
        ingredients: [.tomato, .salad , .tofu],
        spread: .hummus
    )

    static func random() -> Sandwich {
        defer { randomCount += 1 }
        return Sandwich(
            id: Sandwich.ID(rawValue: "\(randomCount)"),
            bread: Bread.allCases.randomElement() ?? .toast,
            ingredients: Ingredient.allCases,
            spread: Spread.allCases.randomElement() ?? .butter
        )
    }
}
