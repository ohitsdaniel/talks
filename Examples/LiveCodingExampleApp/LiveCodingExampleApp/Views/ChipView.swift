import SwiftUI

struct ChipView: View {
    enum Content {
        case bread(Bread)
        case ingredient(Ingredient)
        case spread(Spread)
    }

    let content: Content
    let colorProvider = ChipColorProvider.theme
    let localisationProvider = ChipLocalisationProvider.fixed

    var body: some View {
        Text(name)
            .foregroundColor(color.foreground)
            .padding()
            .background(color.background)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16.0,
                    style: .circular
                )
            )
            .font(.caption)
    }

    private var name: String {
        localisationProvider.name(for: content)
    }

    private var color: ChipColorConfiguration {
        colorProvider.colorConfiguration(for: content)
    }
}
