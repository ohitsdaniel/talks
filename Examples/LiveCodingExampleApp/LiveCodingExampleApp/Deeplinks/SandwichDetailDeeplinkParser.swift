import ComposableDeeplinking

extension DeeplinkParser {
    /// detail?id=0
    static let detailParser = DeeplinkParser(
        parse: { deeplink in
            guard deeplink.components.count == 1,
                  deeplink.components[0].name == "detail",
                  case let .value(id) = deeplink.components[0].arguments?["id"] else {
                return nil
            }

            let sandwichID = Sandwich.ID(rawValue: id)

            return [
                SandwichOverviewScreen().eraseToAnyScreen(),
                SandwichDetailScreen(sandwichID: sandwichID).eraseToAnyScreen()
            ]
        }
    )

    /// home
    static let homeParser = DeeplinkParser(
        parse: { deeplink in
            guard deeplink.components.count == 1,
                  deeplink.components[0].name == "home" else {
                return nil
            }

            return [
                SandwichOverviewScreen().eraseToAnyScreen()
            ]
        }
    )
}
