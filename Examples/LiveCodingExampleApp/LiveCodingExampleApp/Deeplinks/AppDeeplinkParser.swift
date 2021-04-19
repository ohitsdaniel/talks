import ComposableDeeplinking

extension DeeplinkParser {
    static let app = DeeplinkParser.anyOf(
        .detailParser,
        .homeParser
    )
}
